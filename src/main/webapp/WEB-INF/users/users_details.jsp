<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Boxicons CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <title>Cruscotto HR - users-details</title>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
    <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
    <link href="/static/css/app.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<!-- navbar -->

<nav class="navbar">
    <div class="logo_item">
        <i class="bx bx-menu" id="sidebarOpen"></i>
        <button type="button" class="image-button-nav" onclick="goToHomePage()">
            <img src="/static/img/beta80favicon.png" alt="Immagine Bottone"> </i>Home Page
        </button>
    </div>


    <div class="navbar_content" >

        <i class="bi bi-grid"></i>
        <div class="dropdown" style="float:right;">
            <button type="button" class="image-button">
                <img src="/static/img/utente.png.png" alt="Immagine Bottone">
            </button>
            <div class="dropdown-content">

                <a href="#" id="openPopup" ><i class="fas fa-cog"></i>Settings</a>
                <a href="/logout">Logout</a>
                <div id="popup-overlay"></div>

                <div id="popup">
                    <div class="popup-header">
                        <h2>My area</h2>
                        <button id="closePopup">Close</button>
                    </div>
                    <form id="myForm">
                      <label for="benvenuto">Welcome text::</label>
                      <textarea id="benvenuto" name="benvenuto" placeholder="Insert welcome text" disabled></textarea>

                      <label for="email">Email:</label>
                      <input type="email" id="email" name="email" placeholder="insert your email" disabled>

                      <button type="button" id="editButton">Edit</button>
                      <button type="submit" id="saveButton" style="display: none;">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- sidebar -->
<nav class="sidebar">
    <div class="menu_content">

        <ul class="menu_items">
            <div class="menu_title menu_setting"></div>
            <li class="item">
            </li>
            <li class="item">
                              <a onclick="goToHomePage()" class="nav_link">
                                  <span class="navlink_icon">
                                    <i class="bx bx-home"></i>
                                  </span>
                                <span class="navlink">HomePage</span>
                              </a>
                            </li>
            <li class="item">
                <a onclick="goToUsersPage()" class="nav_link">
                  <span class="navlink_icon">
                    <i class="bx bx-face"></i>
                  </span>
                    <span class="navlink">Employees</span>
                </a>
            </li>
            <li class="item">
                <a onclick="goToTaskPage()" class="nav_link">
                  <span class="navlink_icon">
                    <i class="bx bx-layer"></i>
                  </span>
                    <span class="navlink">Task</span>
                </a>
            </li>
        </ul>

        <!-- Sidebar Open / Close -->
        <div class="bottom_content">
            <div class="bottom expand_sidebar">
                <span> Expand </span>
                <i class='bx bx-log-in' ></i>
            </div>
            <div class="bottom collapse_sidebar">
                <span> Reduce </span>
                <i class='bx bx-log-out'></i>
            </div>
        </div>
    </div>
</nav>
<br>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3"></div> <!-- Spazio a sinistra -->
        <div class="col-md-6"> <!-- Contenitore del modulo -->
            <form class="form" action="users" method="put">
                <div class="form-group">
                    <label for="idUser">ID</label>
                    <input id="id" type="text" name="idUser" class="form-control id_record" value="${user_model.idUser}" disabled>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" type="text" name="username" class="form-control" value="${user_model.username}" disabled required="required"></input>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="text" name="password" class="form-control" value="${user_model.password}" disabled required></input>
                </div>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input id="name" type="text" name="name" class="form-control" value="${user_model.name}" disabled required="required" pattern="[A-Z]">
                </div>
                <div class="form-group">
                    <label for="surname">Surname</label>
                    <input id="surname" type="text" name="surname" class="form-control" value="${user_model.surname}" disabled required>
                </div>
                <div class="form-group">
                    <label for="dt">Date</label>
                    <input id="dt" type="date" name="dt" class="form-control" value="${user_model.dt}" disabled>
                </div>
                 <div>
                                     <label for="rl">Role</label>
                                    <br>
                                    <select id="rl" disabled>
                                      <option value="1" ${user_model.rl == 1 ? '' : 'selected'}>EMPLOYEE</option>
                                      <option value="0" ${user_model.rl == 0 ? 'selected' : ''}>HR</option>
                                    </select>
                                </div>
                <br>
                <a id="edit_btn" class="btn btn-primary" href="#"><i class="fa fa-edit"></i> Edit</a>
                <a id="cancel_btn" class="btn btn-primary hidden" href="#">Cancel</a>
                <a id="put_btn" class="btn btn-primary hidden" href="#">Submit</a>
                <button type="button" class="btn btn-primary" onclick="goToUsersPage()" style="float: right;">Back</button>
            </form>
        </div>
        <div class="col-md-3"></div> <!-- Spazio a destra -->
    </div>
</div>


<!-- JavaScript -->
<script src="/static/js/app/script/script.js"></script>
<script>
        function toggleDropdown() {
            var dropdownContent = document.getElementById("myDropdown");
            if (dropdownContent.style.display === "none") {
                dropdownContent.style.display = "block";
            } else {
                dropdownContent.style.display = "none";
            }
        }
</script>
<script>
function goToHomePage() {
        window.location.href = '/hpHR';
    }
</script>
<script>
    function goToUsersPage() {
        window.location.href = '/users';
    }
</script>

<script>
    function goToTaskPage() {
        window.location.href = '/task';
    }
</script>

<script>
document.getElementById('openPopup').addEventListener('click', function(e) {
  e.preventDefault();
  document.getElementById('popup-overlay').style.display = 'block';
  document.getElementById('popup').style.display = 'block';
});

document.getElementById('closePopup').addEventListener('click', function() {
  closePopup();
});

document.getElementById('editButton').addEventListener('click', function() {
  document.getElementById('benvenuto').disabled = false;
  document.getElementById('email').disabled = false;
  document.getElementById('editButton').style.display = 'none';
  document.getElementById('saveButton').style.display = 'inline-block';
});

document.getElementById('saveButton').addEventListener('click', function() {
  // Effettua qui le operazioni di salvataggio dei dati
  document.getElementById('benvenuto').disabled = true;
  document.getElementById('email').disabled = true;
  document.getElementById('editButton').style.display = 'inline-block';
  document.getElementById('saveButton').style.display = 'none';
});

function closePopup() {
  document.getElementById('popup-overlay').style.display = 'none';
  document.getElementById('popup').style.display = 'none';
}

document.getElementById('cancel_btn').addEventListener('click', function() {
document.getElementById('addEmployeeForm').style.display = 'none';
document.getElementById("addEmployeeButton").style.display = "block";

});

</script>
<!-- SYSTEM JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
        <script src="/static/js/popper.min.js" ></script>
        <script src="/static/js/bootstrap.min.js" ></script>
        <script src="/static/js/sb-admin-2.min.js" ></script>
        <script src="/static/js/app/app_utils.js"></script>

        <script>
            var doPutUrl = "/users";
            function enableEdit(e){
                e.preventDefault();
                $('#cancel_btn').removeClass("hidden");
                $('#put_btn').removeClass("hidden");

                $(this).addClass('hidden');
                $("#username").prop('disabled', false);
                $("#password").prop('disabled', false);
                $("#name").prop('disabled', false);
                $("#surname").prop('disabled', false);

            }
            function disableEdit(e){
                e.preventDefault();
                $('#edit_btn').removeClass("hidden");
                $(this).addClass('hidden');
                $('#put_btn').addClass("hidden");
                $("#username").prop('disabled', true);
                $("#password").prop('disabled', true);
                $("#name").prop('disabled', true);
                $("#name").prop('required', true);
                $("#surname").prop('disabled', true);
            }

            function onClickPut(evt){
                var _btnId = $('#id').val();
                var real_url = doPutUrl + "?idUser=" + _btnId;
                spinner_on();
                var data = {
                    username: $("#username").val().trim(),
                    password: $("#password").val().trim(),
                    name: $("#name").val().trim(),
                    surname: $("#surname").val().trim()
                }
                if (data.name == "") {
                    window.alert("Name required");
                    return;
                }
                if (data.surname == "") {
                     window.alert("Surname required");
                     return;
                }if (data.password == "") {
                     window.alert("Password required");
                     return;
                }
                if (data.username == "") {
                    window.alert("Username required");
                    return;
                }
                doPut(data, real_url,
                    function(s){
                        console.log(s);
                        console.log("done");
                        location.reload()
                    },
                    function(err){
                        console.log(err);
                        console.log("fail");
                        location.reload()
                        window.alert("L'username esiste già nel database.");
                    });
            }
            $( document ).ready(function() {
                $("#edit_btn").on("click", enableEdit);
                $("#cancel_btn").on("click", disableEdit);
                $("#put_btn").on("click", onClickPut);

                console.log( "ready!" );
            });
       </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script>
function validateRole(input) {
  if (input.value !== "0" && input.value !== "1") {
    input.value = ""; // Reset il valore dell'input se non è 0 o 1
  }
}
</script>



<script>
  const form = document.getElementById("myForm");
  const benvenutoField = document.getElementById("benvenuto");
  const emailField = document.getElementById("email");
  const editButton = document.getElementById("editButton");
  const saveButton = document.getElementById("saveButton");

  editButton.addEventListener("click", function() {
    benvenutoField.removeAttribute("disabled");
    emailField.removeAttribute("disabled");
    editButton.style.display = "none";
    saveButton.style.display = "inline";
  });

  form.addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    // Here you can perform the necessary actions to save the form data
    // For this example, we'll just log the values to the console
    console.log("Testo di benvenuto:", benvenutoField.value);
    console.log("Email:", emailField.value);

    // Disable the fields and switch the buttons back
    benvenutoField.setAttribute("disabled", "disabled");
    emailField.setAttribute("disabled", "disabled");
    editButton.style.display = "inline";
    saveButton.style.display = "none";
  });
</script>
</body>
</html>