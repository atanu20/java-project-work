function doLike(likepid, likeuid, tmp)
{
   // console.log(likepid + "," + likeuid)
    
    const d = {
        likeuid: likeuid,
        likepid: likepid,
        operation: 'like'
    }

    $.ajax({
        url: "LikeServlet",
        type: 'POST',
        data: d,
        success: function (data, textStatus, jqXHR) {
            //console.log(data);
            if (data.trim() == 'true')
            {
                
                
                let c= $(tmp).find(".like-counter").html();
                //console.log(c);
                c++;
                $('.like-counter',tmp).html(c);               
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}