
document.getElementById('next').onclick = function () {
    let lists = document.querySelectorAll('.item');
    document.getElementById('slide').appendChild(lists[0]);
};
document.getElementById('prev').onclick = function () {
    let lists = document.querySelectorAll('.item');
    document.getElementById('slide').prepend(lists[lists.length - 1]);
};







// 
document.getElementById("sign-in").addEventListener("click", function (event) {
    event.preventDefault();
});

//

let container = document.getElementById('container');

toggle = () => {
    container.classList.toggle('sign-in');
    container.classList.toggle('sign-up');
};

setTimeout(() => {
    container.classList.add('sign-in');
}, 200);


