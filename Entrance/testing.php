<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nbcollege";
$conn = new mysqli($servername, $username, $password, $dbname);

$questions = array();
if ($_SERVER["REQUEST_METHOD"] == "POST" ) {
    $totalMarks = 0;
    $userResponses = array();
    foreach ($_POST['answers'] as $questionId => $selectedOption) {
        $sql = "SELECT correct_answer FROM test_questions WHERE ID = $questionId";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $correctAnswer = $row['correct_answer'];
            $isCorrect = ($selectedOption == $correctAnswer);
            if ($isCorrect) {
                $totalMarks++;
            }
        }
    }
    $username = $_POST['username'];
$email=$_POST['email'];
    $serializedResponses = json_encode($_POST['answers']);
    $insertSql = "INSERT INTO user_results (username, total_marks, user_responses, email) VALUES ('$username', $totalMarks, '$serializedResponses','$email')";
    if ($conn->query($insertSql) === TRUE) {
        if ($totalMarks >= 4) {
            header("Location: result_message.php?message=Congratulations! $username, You passed with total marks obtained = $totalMarks /10. You can now apply for admission.");
        } else {
            header("Location: result_message.php?message=Sorry $username, you didn't meet the required criteria for admission. you failed with total marks obtained = $totalMarks/10");
        }           
    } else {
        echo "Error saving results: " . $conn->error;
    }
}

$sql = "SELECT * FROM test_questions";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // Fetch and display all questions
    while ($row = $result->fetch_assoc()) {
        $questions[] = $row;
    }
} else {
    $questions = array("No questions found.");
}
$conn->close();
?>
<?php
session_start();
error_reporting(0);
include '../LogIn/db.php';
if (strlen($_SESSION['uid']==0)) {
  header('location:../LogIn/logout.php');
  } else{

  ?>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">

    <link rel="stylesheet" href="quizcss.css">
    <title>Quiz Platform</title>
    <script>
    var countdownTime = 100; 
    function updateCountdown() {
        document.getElementById("timer").innerHTML = countdownTime + "s";
        if (countdownTime === 0) {
            disableOptions();
        } else {
            countdownTime--;
            setTimeout(updateCountdown, 1000); 
        }
    }
    function disableOptions() {
        var radioButtons = document.querySelectorAll('input[type="radio"]');
        radioButtons.forEach(function (radioButton) {
            radioButton.disabled = true;
        });
    }
    window.onload = function () {
        updateCountdown();
    };
</script>
</head>
<body>
    <?php
        $uid=$_SESSION['uid'];
        $ret=mysqli_query($con,"SELECT fullname FROM users WHERE ID='$uid'");
        $row=mysqli_fetch_array($ret);
        $fullname=$row['fullname'];
    ?>

<div class="sidebar">
        <header><?php echo $fullname;?></header>
        <a href="rules.php" target="_self" >
            <i class="fas fa-qrcode"></i>
            <span>Dashboard</span>
        </a>
        <a href="#" target="_self" class="active">
            <i class="fas fa-solid fa-file-invoice"></i>
            <span>Entrance Exam</span>
        </a>
    </div>

    <div class="navbar">
        <h2>NB College Admission System</h2>
        <a href="../LogIn/logout.php"><button onclick="return confirm('Are you sure you want to logout?')" type="submit">Logout</button></a>
    </div>
  
<div class="questions">
    <h1 style="border-bottom: 1px solid #d4d4d4;padding-bottom: 5px;">Take the Test</h1>
    <div class="timer" style="display: flex; gap: 10px; align-items: center;">
     <div style="color: #ff6a6a; margin: 10px 0;font-size: 16px;font-weight: 600;">TIME REMAINING:</div><span id="timer" style="font-size: 19px; font-weight: 700; color: #17a717;">100s</span>
    </div>
     <form method="post">
        <div class="auth-form">
            <div class="email-wrapper">
                <label for="email">Email:</label>
               <input type="email" name="email" id="email" required>
            </div>

           <div class="email-wrapper">
               <label for="username">Username:</label>
               <input type="text" name="username" id="username" required>
            </div>
        </div>
        <div class="questions-wrapper">
            <?php
            foreach ($questions as $question) {
                echo "<p classname='question' style=' color: #af1515;'>Question: " . $question['question'] . "</p>";
                echo "<label><input type='radio' name='answers[".$question['ID']."]' value='1'>" . $question['option1'] . "</label><br>";
                echo "<label><input type='radio' name='answers[".$question['ID']."]' value='2'>" . $question['option2'] . "</label><br>";
                echo "<label><input type='radio' name='answers[".$question['ID']."]' value='3'>" . $question['option3'] . "</label><br>";
                echo "<label><input type='radio' name='answers[".$question['ID']."]' value='4'>" . $question['option4'] . "</label><br>";
                echo "<hr class='question-hr'>";
            }
            ?>
        </div>
<button id="submitBtn" type="submit">Submit Answers</button>
</form>
</div>
</body>
</html>

<?php }  ?>