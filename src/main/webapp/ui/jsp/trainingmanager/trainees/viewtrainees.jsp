<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <title>Admin CV</title>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">CV Management</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/homepage">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/trainingmanager/adminpage">My Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/trainingmanager/CV">CV's</a>
        <li class="nav-item dropdown">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Trainees
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="/trainingmanager/trainees/viewtrainees">View</a>
              <a class="dropdown-item" href="/trainingmanager/trainees/addtrainees">Add</a>
              <a class="dropdown-item" href="/trainingmanager/trainees/edittrainees">Amend</a>
            </div>
          </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Trainers
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="/trainingmanager/trainers/viewtrainers">View</a>
            <a class="dropdown-item" href="/trainingmanager/trainers/addtrainers">Add</a>
            <a class="dropdown-item" href="/trainingmanager/trainers/edittrainers">Amend</a>
          </div>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/perform_logout" />">Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div align="center" id="wrapper">
          <h4>Trainees</h4>
          <table align='center' class="table table-striped" cellspacing=2 cellpadding=5 id="data_table" border=1>
              <tr>
                  <th>Username</th>
                  <th>Name</th>
                  <th>Delete</th>
              </tr>
              <tr>
                  <td><input type="text" id="id" disabled></td>
                  <td><input type="text" id="title" disabled></td>
                  <td><input type="button" class="btn btn-danger" onclick="delete();" value="Delete Trainer"></td>
              </tr>

          </table>

          <br>
          <a href="addtrainees"><button class="btn btn-success">Add Trainee</button></a>
          &nbsp;&nbsp;
          <input type="button" class="btn btn-success" onclick="listAllMovies()" value="List all trainees" />
      </div>

    <script type="text/javascript">
    //     function edit_row(no) {
    // document.getElementById("edit_button" + no).style.display = "none";
    // document.getElementById("save_button" + no).style.display = "block";
    //
    // var title = document.getElementById("title_row" + no);
    // var genre = document.getElementById("genre_row" + no);
    // var rating = document.getElementById("rating_row" + no);
    //
    // var title_data = name.innerHTML;
    // var genre_data = country.innerHTML;
    // var rating_data = age.innerHTML;
    //
    // name.innerHTML = "<input type='text' id='title_text" + no + "' value='" + name_data + "'>";
    // country.innerHTML = "<input type='text' id='genre_text" + no + "' value='" + genre_data + "'>";
    // age.innerHTML = "<input type='text' id='rating_text" + no + "' value='" + rating_data + "'>";
    // }
    //
    // function save_row(no) {
    // var title_val = document.getElementById("title_text" + no).value;
    // var genre_val = document.getElementById("genre_text" + no).value;
    // var rating_val = document.getElementById("rating_text" + no).value;
    //
    // document.getElementById("title_row" + no).innerHTML = title_val;
    // document.getElementById("genre_row" + no).innerHTML = genre_val;
    // document.getElementById("rating_row" + no).innerHTML = rating_val;
    //
    // document.getElementById("edit_button" + no).style.display = "block";
    // document.getElementById("save_button" + no).style.display = "none";
    // }
    //
    // function delete_row(no) {
    // var id = document.getElementById("id").value;
    //
    // var x = new XMLHttpRequest();
    // var url = "http://localhost:8081/Movie/api/movie/deleteAccount/"+id;
    // x.open("DELETE", url);
    // x.send();
    // document.getElementById("row" + no + "").outerHTML = "";
    //
    // }
    //
    // function add_row() {
    // var title = document.getElementById("title").value;
    // var genre = document.getElementById("genre").value;
    // var rating = document.getElementById("rating").value;
    //
    // createMovie(title,genre,rating);
    //
    // var table = document.getElementById("data_table");
    // var table_len = (table.rows.length) - 1;
    // var row = table.insertRow(table_len).outerHTML = "<tr id='row" + table_len + "'><td id='id_row" + table_len + "'>" + id + "</td><td id='title_row" + table_len + "'>" + title + "</td><td id='genre_row" + table_len + "'>" + genre + "</td><td id='rating_row" + table_len + "'>" + rating + "</td><td><input type='button' id='edit_button" + table_len + "' value='Edit' class='edit' onclick='edit_row(" + table_len + ")'> <input type='button' id='save_button" + table_len + "' value='Save' class='save' onclick='save_row(" + table_len + ")'> <input type='button' value='Delete' class='delete' onclick='delete_row(" + table_len + ")'></td></tr>";
    //
    //
    // document.getElementById("title").value = "";
    // document.getElementById("genre").value = "";
    // document.getElementById("rating").value = "";
    //
    // }
    //
    // function getHttp(url) {
    // var xmlHttp = new XMLHttpRequest();
    // xmlHttp.open("GET", url, false); // false for synchronous request
    // xmlHttp.send(null);
    // return xmlHttp.responseText;
    //
    // }
    //
    // function listAllMovies() {
    // console.log("listing movies")
    // populateTable(getHttp('http://localhost:8081/Movie/api/movie/getAllMovies'));
    //
    // }
    //
    // function populateTable(jsonT) {
    // var jsonTest = jsonT;
    // var myObj = JSON.parse(jsonTest);
    // var table = document.getElementById("data_table");
    // for (x in myObj) {
    //   var id = myObj[x].id;
    //   var title = myObj[x].title;
    //   var genre = myObj[x].genre;
    //   var rating = myObj[x].rating;
    //   var table_len = (table.rows.length) - 1;
    //   var row = table.insertRow(table_len).outerHTML = "<tr id='row" + table_len + "'><td id='id_row" + table_len + "'>" + id + "</td><td id='title_row" + table_len + "'>" + title + "</td><td id='genre_row" + table_len + "'>" + genre + "</td><td id='rating_row" + table_len + "'>" + rating + "</td><td><input type='button' id='edit_button" + table_len + "' value='Edit' class='edit' onclick='edit_row(" + table_len + ")'> <input type='button' id='save_button" + table_len + "' value='Save' class='save' onclick='save_row(" + table_len + ")'> <input type='button' value='Delete' class='delete' onclick='delete_row(" + table_len + ")'></td></tr>";
    // }
    // }
    //
    // function createMovie(title, genre, rating){
    // var x = new XMLHttpRequest();
    // var url = "http://localhost:8081/Movie/api/movie/addMovie";
    // x.open("POST", url, true);
    // x.send(JSON.stringify({title:title,genre:genre,rating:rating}));
    //
    // }
    </script>
</body>
</html>
