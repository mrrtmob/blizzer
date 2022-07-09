var html = '';
var num1 = '';
var num2 = '';
var s = "";
function buildButton(rowname, num) {
    html += '<input type="button" value="' + num + '"onclick="btnclick(' + '\'' + num + '\'' + ')"/>'
    document.getElementById(rowname).innerHTML = html;

}
function buildRow(rowname, num1, num2, num3) {
    html = "";
    buildButton(rowname, num1);
    buildButton(rowname, num2);
    buildButton(rowname, num3);

}
buildRow('row1', 1, 2, 3);
buildRow('row2', 4, 5, 6);
buildRow('row3', 7, 8, 9);
buildRow('row4', "+", "-", "*");
buildRow('row5', "0", "=", "/");

function btnclick(num) {

    if (num == "+" || num == "-" || num == "*"
        || num == "/") {
        s = num;
        document.getElementById("num").value = ""

    } else {
        if (s == "") {
            num1 += num;
            document.getElementById("num").value = parseFloat(num1);
        } else {
            
            if (num == "=") {

                document.getElementById("num").value = s == "+" ? (parseFloat(num2) + parseFloat(num1)) : s == "-" ? (parseFloat(num2) - parseFloat(num1)) : s == "*" ? (parseFloat(num2) * parseFloat(num1)) : s == "/" ? (parseFloat(num2) / parseFloat(num1)):"";
            }else{
                num2 += num;
            document.getElementById("num").value = parseFloat(num2);
            }
            


        }
    }


}