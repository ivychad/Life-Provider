$(document).ready(function () {
    $("a[href]").filter(function (index, element) {
        return !element.attr("href").includes(location.host);
    }).attr({
        target: "_blank",
        rel: "noopener noreferrer"
    });
});