// Obtener los elementos de radio
var radioElements = document.getElementsByName('tipo_user');
var cardUser = document.getElementById("card-user");
var cardEmpresa = document.getElementById("card-empresa");
var formUser = document.getElementById("form-user");
var formEmpresa = document.getElementById("form-empresa");
var buttonClose = document.getElementsByName("btn-close");


formUser.style.display = "none";
formEmpresa.style.display = "none";
cardUser.style.display = "block";
cardEmpresa.style.display = "block";

// Asignar el evento change a cada elemento de radio
radioElements.forEach(function (element) {
  element.addEventListener('change', function () {
    $check = this.value;
    console.log(this.value);

    buttonClose.forEach(function (element) {
      element.addEventListener('click', function () {
        $check = "";
        if($check == ""){
          formUser.style.display = "none";
          formEmpresa.style.display = "none";
          cardUser.style.display = "block";
          cardEmpresa.style.display = "block";
        }
      })
    });

    if (this.value == "user") {
      cardUser.style.display = "none";
      cardEmpresa.style.display = "none";
      formUser.style.display = "block";
      formEmpresa.style.display = "none";
    } else if (this.value == "empresa") {
      formUser.style.display = "none";
      formEmpresa.style.display = "block";
      cardUser.style.display = "none";
      cardEmpresa.style.display = "none";
    }
  });
});
