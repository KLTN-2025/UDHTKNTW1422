using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class web_module_KhoLuyenTap_BaiKiemTra_ChiTiet : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int testId = 0;
    public int luyentapId = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get test ID from route or query string
        if (RouteData.Values["id_test"] != null)
        {
            testId = Convert.ToInt32(RouteData.Values["id_test"]);
        }
        else if (Request.QueryString["id"] != null)
        {
            testId = Convert.ToInt32(Request.QueryString["id"]);
        }
        
        if (!IsPostBack)
        {
            LoadTestData();
            LoadQuestions();
        }
    }

    protected void LoadTestData()
    {
        var test = (from t in db.tbTracNghiem_Tests
                   where t.test_id == testId && t.hidden == true
                   select t).FirstOrDefault();
        
        if (test != null)
        {
            testIdHidden.Value = test.test_id.ToString();
            luyentapId = test.luyentap_id ?? 0;
            
            // Get test title
            var luyentap = (from lt in db.tbTracNghiem_BaiLuyenTaps
                           where lt.luyentap_id == luyentapId
                           select lt).FirstOrDefault();
            
            if (luyentap != null)
            {
                testTitle.InnerText = luyentap.luyentap_name;
            }
            
            // Set time limit (default 15 minutes = 900 seconds)
            int timeLimitSeconds = 900;
            if (!string.IsNullOrEmpty(test.test_thoigianlambai))
            {
                int minutes;
                if (int.TryParse(test.test_thoigianlambai, out minutes))
                {
                    timeLimitSeconds = minutes * 60;
                }
            }
            timeLimit.Value = timeLimitSeconds.ToString();
        }
    }

    protected void LoadQuestions()
    {
        var test = (from t in db.tbTracNghiem_Tests
                   where t.test_id == testId && t.hidden == true
                   select t).FirstOrDefault();
        
        List<object> questionsList = new List<object>();
        
        // Get questions from test.question_id (string containing comma-separated IDs)
        if (test != null && !string.IsNullOrEmpty(test.question_id))
        {
            var questionIds = test.question_id.Split(',');
            foreach (var qIdStr in questionIds)
            {
                int questionId;
                if (int.TryParse(qIdStr.Trim(), out questionId))
                {
                    var question = (from q in db.tbTracNghiem_Questions
                                  where q.question_id == questionId && (q.hidden != true || q.hidden == null)
                                  select q).FirstOrDefault();
                    
                    if (question != null)
                    {
                        var answers = GetAnswersForQuestion(questionId, test);
                        questionsList.Add(new
                        {
                            id = question.question_id,
                            title = "Câu " + (questionsList.Count + 1),
                            content = question.question_content ?? "",
                            answers = answers,
                            correctAnswer = ""
                        });
                    }
                }
            }
        }
        else
        {
            // Fallback: Get questions from test_detail
            var testDetails = (from td in db.tbTracNghiem_TestDetails
                              where td.test_id == testId && (td.hidden != true || td.hidden == null)
                              select td).ToList();
            
            foreach (var detail in testDetails)
            {
                if (detail.question_id.HasValue)
                {
                    var question = (from q in db.tbTracNghiem_Questions
                                  where q.question_id == detail.question_id.Value && (q.hidden != true || q.hidden == null)
                                  select q).FirstOrDefault();
                    
                    if (question != null)
                    {
                        var answers = GetAnswersForQuestion(question.question_id, test);
                        questionsList.Add(new
                        {
                            id = question.question_id,
                            title = "Câu " + (questionsList.Count + 1),
                            content = question.question_content ?? "",
                            answers = answers,
                            correctAnswer = ""
                        });
                    }
                }
            }
        }
        
        totalQuestions.Value = questionsList.Count.ToString();
        
        // Serialize questions to JSON for JavaScript
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        string questionsJson = serializer.Serialize(questionsList);
        
        // Register script to load questions
        string script = string.Format(@"
            <script>
                if (typeof loadQuestions === 'function') {{
                    loadQuestions({0});
                }} else {{
                    window.questionsData = {0};
                    window.addEventListener('load', function() {{
                        if (typeof loadQuestions === 'function') {{
                            loadQuestions(window.questionsData);
                        }}
                    }});
                }}
            </script>
        ", questionsJson);
        
        ClientScript.RegisterStartupScript(this.GetType(), "LoadQuestions", script);
    }

    protected List<object> GetAnswersForQuestion(int questionId, tbTracNghiem_Test test)
    {
        List<object> answers = new List<object>();
        
        // Try to get answers from test.test_show (format: answer1|answer2|answer3|answer4)
        if (test != null && !string.IsNullOrEmpty(test.test_show))
        {
            var answerParts = test.test_show.Split('|');
            for (int i = 0; i < answerParts.Length && i < 4; i++)
            {
                answers.Add(new
                {
                    id = i + 1,
                    content = answerParts[i].Trim()
                });
            }
        }
        
        // If no answers found, try to get from question's test_show or create sample
        if (answers.Count == 0)
        {
            var question = (from q in db.tbTracNghiem_Questions
                          where q.question_id == questionId
                          select q).FirstOrDefault();
            
            // Create sample answers based on question type
            // For Japanese questions, create typical answers
            answers.Add(new { id = 1, content = "きゃいん" });
            answers.Add(new { id = 2, content = "ちゃいん" });
            answers.Add(new { id = 3, content = "にゃいん" });
            answers.Add(new { id = 4, content = "しゃいん" });
        }
        
        return answers;
    }

    protected void btnSubmitTest_Click(object sender, EventArgs e)
    {
        // Get user answers from hidden field or request
        string answersJson = Request.Form["userAnswers"] ?? "";
        
        // Parse and save results
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        Dictionary<string, object> answers = new Dictionary<string, object>();
        
        try
        {
            answers = serializer.Deserialize<Dictionary<string, object>>(answersJson);
        }
        catch { }
        
        // Calculate score and save to database
        int score = 0;
        int total = Convert.ToInt32(totalQuestions.Value);
        
        // Save result to database
        // TODO: Implement result saving logic
        
        // Redirect to results page
        Response.Redirect("/ket-qua-kiem-tra-" + testId);
    }
}

