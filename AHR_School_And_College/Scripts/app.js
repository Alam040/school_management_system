
const jobType = document.getElementsByClassName("job-type");
const len = jobType.length;

for (let i = 0; i < jobType.length; i++) {
    if (jobType[i].innerHTML === "Teacher") {
        jobType[i].classList.add("job-type-teacher");
        document.getElementsByClassName("card-img-rel")[i].classList.add("card-img-rel-teacher");
    }
}

const form = document.getElementById("form1");



//uploadBtn.attributes[0] = "button";

const hangle_change_image = () => {
    const oFile = document.getElementById("ContentPlaceHolder1_oFile");
    const uploadBtn = document.getElementById('upload_image');
    const up_img = document.getElementById("up_img");

    oFile.addEventListener("change", (e) => {
        e.preventDefault()
        //uploadBtn.setAttribute("type", 'button')
        uploadBtn.nodeType = "button";
        const reader = new FileReader();
        reader.readAsDataURL(e.target.files[0]);
        //oFile.setAttribute("Name", e.target.files[0])
        oFile.nodeValue
        console.log(oFile);

        reader.onload = () => {
            if (reader.readyState === 2) {
                up_img.src = reader.result;
                //console.log(up_img);
            }
        };

        //uploadBtn.click();
    })
}



const sortBtn1 = () => {
    document.getElementById("sort1").addEventListener("click", () => {
        document.getElementById("btn_1").click();
        console.log("btn1");
    });
}
const sortBtn2 = () => {
    document.getElementById("sort2").addEventListener("click", () => {
        document.getElementById("btn_2").click();
        console.log("btn2");
    });
}



const handleDropBtn = () => {
    const btn = document.getElementsByClassName("drop-btn");

    for (let i = 0; i < btn.length; i++) {
        //document.getElementsByClassName("more-info")[i].classList.add("d-none");
        if (btn[i].click === true) {
            console.log(i);
        }
        btn[i].addEventListener("click", () => {
            console.log(document.getElementsByClassName("more-info"));
            console.log(i.click == true);
            //document.getElementsByClassName("more-info")[i].classList.remove("d-none");
        });
    }
}

