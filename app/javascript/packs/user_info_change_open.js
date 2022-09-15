window.addEventListener("turbolinks:load", function(){
    class UserInfoChangeOpen{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".login_user_name_pas_change");
        this.DOM.xbtn = document.querySelector("#user_info_x_btn");
        this.DOM.cover = document.querySelector(".user_name_pas_change_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }
        _toggle() {
            this.DOM.container.classList.toggle("user_info_change_open");
        }

        _addEvent() {
            this.DOM.btn.addEventListener('click', this._toggle.bind(this));
            this.DOM.xbtn.addEventListener('click', this._toggle.bind(this));
            this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }
    class UserIconChangeOpen{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".user_icon_change_btn");
        this.DOM.xbtn = document.querySelector("#user_icon_change_x_btn");
        this.DOM.cover = document.querySelector(".user_icon_change_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }
        _toggle() {
            this.DOM.container.classList.toggle("user_icon_change_open");
        }

        _addEvent() {
            this.DOM.btn.addEventListener('click', this._toggle.bind(this));
            this.DOM.xbtn.addEventListener('click', this._toggle.bind(this));
            this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }
    class UserNameChangeOpen{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".login_user_name");
        this.DOM.xbtn = document.querySelector("#user_name_change_x_btn");
        this.DOM.cover = document.querySelector(".user_name_change_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }
        _toggle() {
            this.DOM.container.classList.toggle("user_name_change_open");
        }

        _addEvent() {
            this.DOM.btn.addEventListener('click', this._toggle.bind(this));
            this.DOM.xbtn.addEventListener('click', this._toggle.bind(this));
            this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }
    class BestComicsChangeOpen{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".best_comics_change_icon_btn");
        this.DOM.xbtn = document.querySelector("#best_comics_x_btn");
        this.DOM.cover = document.querySelector(".best_comics_change_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }

        _toggle() {
            this.DOM.container.classList.toggle("best_comics_change_open");
        }

        _addEvent() {
            this.DOM.btn.addEventListener('click', this._toggle.bind(this));
            this.DOM.xbtn.addEventListener('click', this._toggle.bind(this));
            this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }
    class KnowComicsChangeOpen{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".know_comics_change_icon_btn");
        this.DOM.xbtn = document.querySelector("#know_comics_x_btn");
        this.DOM.cover = document.querySelector(".know_comics_change_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }

        _toggle() {
            this.DOM.container.classList.toggle("know_comics_change_open");
        }

        _addEvent() {
            this.DOM.btn.addEventListener('click', this._toggle.bind(this));
            this.DOM.xbtn.addEventListener('click', this._toggle.bind(this));
            this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }
    new UserInfoChangeOpen();
    new UserIconChangeOpen();
    new UserNameChangeOpen();
    new BestComicsChangeOpen();
    new KnowComicsChangeOpen();
})