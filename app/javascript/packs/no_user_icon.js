// window.addEventListener("turbolinks:load", function(){
// class NoUsericon{
//     constructor() {
//     this.DOM = {};
//     this.DOM.btn = document.querySelector(".no_login_user_icon");
//     this.DOM.xbtn = document.querySelector(".no_x_btn_user_icon");
//     this.DOM.cover = document.querySelector(".no_user_icon__cover");
//     this.DOM.container = document.querySelector("#all");
//     this.eventType = this._getEventType();
//     this._addEvent();
//     }

//     _getEventType() {
//         const isTouchCapable =
//             "ontouchstart" in window ||
//             (window.DocumentTouch && document instanceof window.DocumentTouch) ||
//             navigator.maxTouchPoints > 0 ||
//             window.navigator.msMaxTouchPoints > 0;
//     return isTouchCapable ? "touchstart" : "click";
//     }

//     _toggle() {
//         this.DOM.container.classList.toggle("user_icon-open");
//     }

//     _addEvent() {
//         this.DOM.btn.addEventListener(this.eventType, this._toggle.bind(this));
//         this.DOM.xbtn.addEventListener(this.eventType, this._toggle.bind(this));
//         this.DOM.cover.addEventListener(this.eventType, this._toggle.bind(this));
//     }
// }
// new NoUsericon();
// })
// window.addEventListener("turbolinks:load", function(){
//     class Usericon{
//         constructor() {
//         this.DOM = {};
//         // this.DOM.btn_1 = document.querySelector(".article_main_comment_icon_heart_not");
//         this.DOM.btn_1 = $(".no_login_heart");
//         this.DOM.xbtn = document.querySelector(".no_login_heart_x_btn");
//         this.DOM.cover = document.querySelector(".no_login_heart_cover");
//         this.DOM.container = document.querySelector("#all");
//         this.eventType = this._getEventType();
//         this._addEvent();
//         }

//         _getEventType() {
//             const isTouchCapable =
//                 "ontouchstart" in window ||
//                 (window.DocumentTouch && document instanceof window.DocumentTouch) ||
//                 navigator.maxTouchPoints > 0 ||
//                 window.navigator.msMaxTouchPoints > 0;
//         return isTouchCapable ? "touchstart" : "click";
//         }

//         _toggle() {
//             this.DOM.container.classList.toggle("no_login_heart_open");
//         }

//         _addEvent() {
//             this.DOM.btn_1.addEventListener(this.eventType, this._toggle.bind(this));
//             this.DOM.xbtn.addEventListener(this.eventType, this._toggle.bind(this));
//             this.DOM.cover.addEventListener(this.eventType, this._toggle.bind(this));
//         }
//     }
//     new Usericon();
// })