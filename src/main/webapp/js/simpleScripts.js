$(document).on("click",function(event){
    var switcher = $(".switch");
    $.each(switcher,function(key,value){
        if(event.target === value){
            event.preventDefault();
            console.log(event.target.href);

            var targetLink = event.target.href;
            var myInit = {
                method: 'PUT',
                mode: 'cors',
                cache: 'default'
            };

            fetch(targetLink, myInit).then(function(response){
                response.json().then(function(books){
                })
            })
        }
    });
});

//<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
//<script type="text/JavaScript" src="../../../js/simpleScripts.js"></script>
