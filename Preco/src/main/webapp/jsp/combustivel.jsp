<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Combustivel mais barato</title>

<!-- Bootstrap -->
<link
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
  rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
  <div class="container" style="margin-top: 30px">
    <div class="col-md-12">
      <div class="modal-dialog" style="margin-bottom: 0">
        <div class="modal-content">
          <div class="panel-heading">
            <h3 class="panel-title">Qual Combustível?</h3>
          </div>
          <div class="panel-body">
            <form role="form">
              <fieldset>
                <div class="form-group">
                  <input class="form-control" placeholder="Preço do álcool" name="pa"
                    type="text" value="${param.pa}">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Preço da Gasolina" name="gas"
                    type="text" value="${param.gas}">
                </div>
                <input type="submit" class="btn btn-sm btn-success" value="Calcular">
              </fieldset>
            </form>
            <br>

            <%!
            float calcular(float gas, float pa) {
              return pa/gas;
            }
            %>

            <%
            String paramPa = request.getParameter("pa");
            paramPa = paramPa == null ? "0" : paramPa;
            float pa = Float.parseFloat(paramPa);

            String paramGas = request.getParameter("gas");
            paramGas = paramGas == null ? "0" : paramGas;
            float gas = Float.parseFloat(paramGas);
            
            if (gas == 0 || pa == 0) {
%>

<div class="alert alert-danger" role="alert">Coloque algum valor nos campos.</div>
<%
            } else {
              float qm = calcular(gas, pa);
              String resultado;
              if (qm <= 0.7) {
                resultado = "Gasolina é melhor!";
              } else{
                resultado = "Álcool é melhor";
              }
              %>

<div class="alert alert-success" role="alert">
Resultado: <%out.print(resultado);%>
</div>
              <%
            }
            %>
            <br>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>