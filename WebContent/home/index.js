function deleteHandle(event){
    const currentDelBtn = event.target;
    const btnId = currentDelBtn.id;
    sessionStorage.setItem("index",btnId);
    console.log(sessionStorage.getItem("index"));
    location.href="delete_process.jsp";
}

function init(){
    loadData();
}
function loadData(){
    const localImagesData = localStorage.getItem("images");
    if(localImagesData !== null){
        const parsedImagesData = JSON.parse(localImagesData);
        parsedImagesData.forEach(function(imageData){
            makeElementImage(imageData);
        })
    }
}

function makeElementImage(imageData){
    const imagesDiv = document.querySelectorAll('.images');
    //console.log(imagesDiv);

    var newDiv = document.createElement("div");
    newDiv.setAttribute("class", "image");

    var newImg = document.createElement("img");
    newImg.src = imageData.path;

    var newID = document.createElement("p");
    newID.setAttribute("class","image__year");
    var newText = document.createTextNode("작성자 : " + imageData.author);
    newID.appendChild(newText);

    var newTitle = document.createElement("h1");
    newTitle.setAttribute("class", "image__title");
    newText = document.createTextNode(imageData.title);
    newTitle.appendChild(newText);

    var newDate = document.createElement("span");	
    newDate.setAttribute("class", "image__year");
    newText = document.createTextNode("작성일 : " + imageData.dateMade);
    newDate.appendChild(newText);

    var newTag = document.createElement("p");
    newTag.setAttribute("class", "image__rating");
    newText = document.createTextNode("태그 :" + imageData.tag);
    newTag.appendChild(newText);

    var newComment = document.createElement("p");
    newComment.setAttribute("class", "image__rating");
    newText = document.createTextNode("comment :" + imageData.comment);
    newComment.appendChild(newText);                

    var newForm = document.createElement("form");
    newForm.action ="delete_process.jsp";
    newForm.method = "post";


    var delBtn = document.createElement("button");
    delBtn.setAttribute("class","btn btn-outline-danger");
    delBtn.setAttribute("name","index");
    delBtn.setAttribute("value",imageData.priNumber);
    newText = document.createTextNode("삭제");
    delBtn.appendChild(newText);
    delBtn.type = "submit";

   // console.log(imageData.number);
   newForm.appendChild(delBtn);

    newDiv.appendChild(newImg);
    newDiv.appendChild(newTitle);
    newDiv.appendChild(newID);
    newDiv.appendChild(newDate);
    newDiv.appendChild(newTag);
    newDiv.appendChild(newComment);
    newDiv.appendChild(newForm);


    imagesDiv[0].appendChild(newDiv);
}

window.onload = init();


