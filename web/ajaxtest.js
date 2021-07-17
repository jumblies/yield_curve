function main()
{    console.log("main function");
    console.log("ajax request to the resource which will require cors enabled");    
	   $.ajax({
        type: "GET",
        url: "https://www.treasury.gov/resource-center/data-chart-center/interest-rates/Datasets/yield.xml",
        async:true,
        dataType : 'jsonp',   //you may use jsonp for cross origin request
        crossDomain:true,
        success: function(data, status, xhr) {
            console.log("success");
            return xhr;

        }
    });
    var xmlDoc =xhr.responseXML();
    first_date_label = xmlDoc.getElementsByTagName("G_NEW_DATE")[0].firstChild.textContent;
    no_of_dates = xmlDoc.getElementsByTagName("G_NEW_DATE").length;
    console.log("number of dates is " + no_of_dates);
    
}