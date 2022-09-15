document.addEventListener("turbolinks:load", function() {
    // コメントの返信を記述するtextareaの表示切り替え
    $('.article_main_comment_replay_btn').on('click', function() {
        $(this).parents(".article_comment_show").find('#textarea_btn').slideToggle(300);
    });
// 返信クリックしたとき、テキストエリア表示
    $('.article_main_comment_replay_btn_2').on('click', function() {
        $(this).parents(".article_comment_area").find('.main_replay').slideToggle(300);
    });
    $('.tab_list_item').on('click', function(){
        let index = $('.tab_list_item').index(this);
        $('.tab_list_item').removeClass('here_tab');
        $(this).addClass('here_tab');
        $('.tab_content').removeClass('here_content');
        $('.tab_content').eq(index).addClass('here_content');
    });
    // 自分の投稿のタブのクラス付与
    $('.my_post_tab_list_item').on('click', function(){
        let index = $('.my_post_tab_list_item').index(this);
        $('.my_post_tab_list_item').removeClass('here_tab');
        $(this).addClass('here_tab');
        $('.tab_my_post_content').removeClass('here_content');
        $('.tab_my_post_content').eq(index).addClass('here_content');
    });
    // each.htmlのタブのクラス付与
    $('.each_post_tab_list_item').on('click', function(){
        let index = $('.each_post_tab_list_item').index(this);
        $('.each_post_tab_list_item').removeClass('here_tab');
        $(this).addClass('here_tab');
        $('.tab_each_post_content').removeClass('here_content');
        $('.tab_each_post_content').eq(index).addClass('here_content');
    });
    // 投稿一覧のタブのクラス付与
    $('.post_index_tab_list_item').on('click', function(){
        let index = $('.post_index_tab_list_item').index(this);
        $('.post_index_tab_list_item').removeClass('here_tab');
        $(this).addClass('here_tab');
        $('.tab_post_index_content').removeClass('here_content');
        $('.tab_post_index_content').eq(index).addClass('here_content');
    });
    // // showのコメントのタブのクラス付与
    // $('.show_comments_tab_list_item').on('click', function(){
    //     let index = $('.show_comments_tab_list_item').index(this);
    //     $('.show_comments_tab_list_item').removeClass('here_tab');
    //     $(this).addClass('here_tab');
    //     $('.show_comments_tab_content').removeClass('here_content');
    //     $('.show_comments_tab_content').eq(index).addClass('here_content');
    // });
    // コメントチラ見
    $('.little_show_btn').on('click',function(){
        let little_show = $(this).parents('li').find('.little_show_comment');
        let my_post_little_show = $(this).parents('.tab_my_post_content').find('.little_show_comment');
        little_show.slideToggle(300);
        my_post_little_show.slideToggle(300);
    });
    // コメントチラ見

    // 投稿をチラ見
    $('.popular_manga_more_post').on('click',function(){
        let popular_manga_more_post_show = $(this).parents('.popular_manga_li').find('.popular_manga_posts');
        popular_manga_more_post_show.slideToggle(300);
    });
    $('.aritcle_comment_mago_show_btn').on('click',function(){
        let article_comments_mago = $(this).parent();
        article_comments_mago.addClass('mago_comment_open');
    });
    $('.article_comment_mago_close_btn').on('click',function(){
        let article_comments_mago = $(this).parents('.article_comments_mago');
        article_comments_mago.removeClass('mago_comment_open');
    });
    // コメントの•••マーク
    $('.comment_user_menu').on('click', function(){
        $(this).toggleClass("comment_menu_open");
    });
    $(window).on("scroll",function() {
        $("#all").removeClass("article_menu-open");
        if ($(".comment_user_menu").hasClass("comment_menu_open")) {
            $(".comment_user_menu").removeClass("comment_menu_open");
        }
    })

    $(document).on('click',function(e) {
        // console.log(!$(e.target).is('.comment_menu_open'));
        if(!$(e.target).is('.comment_menu_open')){
            // ターゲット要素の外側をクリックした時の操作
            if ($(".comment_user_menu").hasClass("comment_menu_open")) {
                $(".comment_user_menu").removeClass("comment_menu_open");
            }
        };
    });

    

    // 検索バツボタン
    $('.search_x_btn_icon').on('click',function(){
        $("#search-bar").val('');
    });
    // ログインしていないときにいいねボタンを押した反応
    $('.no_login_heart_icon_num').on('click', function(){
        var all = $(this).parents('#all');
        all.addClass('no_login_heart_open');
    });
    $('.no_login_heart_x_btn').on('click', function(){
        var all = $(this).parents('#all');
        all.removeClass('no_login_heart_open');
    });
    $('.no_login_heart_cover').on('click', function(){
        var all = $(this).parents('#all');
        all.removeClass('no_login_heart_open');
    });
    
    // ログインのテキストラベルの動き
    
    if ( $(".login_show_form_name").val() || $(".login_show_form_password").val()){
        $(".login_show_form").parent().find('label').addClass("active");
    }
    $('.login_show_form').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.login_show_form').on('focusout', function() {
        if (!this.value) {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // 新規登録のテキストラベルの動き
    if ( $(".shinki_show_form").val()){
        $(".shinki_show_form").parent().find('label').addClass("active");
    }
    $('.shinki_show_form').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.shinki_show_form').on('focusout', function() {
        if (!this.value) {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // 新規投稿フォームのテキストラベルの動き
    $('.new_post_tittle_textarea').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.new_post_tittle_textarea').on('focusout', function() {
        if (!this.value) {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // 内容のラベルの動き
    $('.new_post_content_textarea').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.new_post_content_textarea').on('focusout', function() {
        if (!this.value) {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // マイページのユーザー名の変更ラベル
    if ( $(".user_info_form").val()){
        $(".user_info_form").parent().find('label').addClass("active");
    }
    $('.user_info_form').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.user_info_form').on('focusout', function() {
        if (!this.value) {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // 編集ページのタイトルラベルの動き
    $('.edit_tittle_textarea').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.edit_tittle_textarea').on('focusout', function() {
            $(this).parent().find('label').removeClass('active');
    });
    // 編集ページの内容ラベルの動き
    $('.edit_content_textarea').on('focusin', function() {
        $(this).parent().find('label').addClass('active');
    });
    $('.edit_content_textarea').on('focusout', function() {
        $(this).parent().find('label').removeClass('active');
    });

    $('.js-select').select2({
        placeholder: '',
        allowClear: true
    });
    $('.select').attr('data-select2-id','member_2');
    $('.select').select2({
        placeholder: '',
        allowClear: true
    });

    $('.flash').fadeOut(5000);
    
    // 人気漫画ランキングのもっと見るボタン
    $(".popular_manga_more_show_icon").on('click',function(){
        $(".popular_mangas").addClass('popular_rank_open');
    })
    // 急上昇ランキングのもっとみるボタン
    $(".hot_article_comment_more_show_btn").on('click',function(){
        $(".hot_articles").addClass('hot_article_rank_open');
    })
    // 昨日、週間、月間の人気投稿ランキングのもっと見るボタン
    $(".yesterday_popular_article_more_show_btn").on('click',function(){
        $(".yesterday_tab_content").addClass('yesterday_popular_article_rank_open');
    })
    $(".week_popular_article_more_show_btn").on('click',function(){
        $(".week_tab_content").addClass('week_popular_article_rank_open');
    })
    $(".month_popular_article_more_show_btn").on('click',function(){
        $(".month_tab_content").addClass('month_popular_article_rank_open');
    })
    // 昨日、週間、月間の人気投稿ランキングのもっと見るボタン(スマホ版)
    $(".yesterday_popular_article_more_show_btn_mobile").on('click',function(){
        $(this).parents(".swiper-slide").addClass('yesterday_popular_article_rank_open');
    })
    $(".week_popular_article_more_show_btn_mobile").on('click',function(){
        $(this).parents(".swiper-slide").addClass('week_popular_article_rank_open');
    })
    $(".month_popular_article_more_show_btn_mobile").on('click',function(){
        $(this).parents(".swiper-slide").addClass('month_popular_article_rank_open');
    })
    // アイコン変更ファイルが選択された時に変更ボタンを有効にする
    $(".user_icon_change").on('change', function(){
        if (!this.value) {
            $(this).parents(".user_icon_change_form").find(".user_icon_change_btn_submit").removeClass("user_icon_text_in");
        }else{
            $(this).parents(".user_icon_change_form").find(".user_icon_change_btn_submit").addClass("user_icon_text_in");
        }
    });  
    // ユーザー名変更テキストエリアに入力された時に変更ボタンを有効にする
    $(".user_name_form").on('input', function(){
        $(this).parents(".user_name_change_form").find(".user_name_change_btn_submit").addClass("user_name_text_in");
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".user_name_change_form").find(".user_name_change_btn_submit").removeClass("user_name_text_in");
        }
        if( this.value.length > 30){
            $(this).parents(".user_name_change_form").addClass("user_name_change_length_over");
        }else{
            $(this).parents(".user_name_change_form").removeClass("user_name_change_length_over");
        }
    });  
    $(".user_name_form").on('focusout', function(){
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".user_name_change_form").find(".user_name_change_btn_submit").removeClass("user_name_text_in");
        }
    });
    // パスワード変更テキストエリアに入力された時に変更ボタンを有効にする
    $(".user_info_form").on('input', function(){
        let user_pas_change_form = document.querySelector(".user_pas_change_form");
        let user_pas_confirmation_change_form = document.querySelector(".user_pas_confirmation_change_form");
        $(this).parents(".user_info_change_form").find(".user_info_change_btn").addClass("user_info_text_in");
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".user_info_change_form").find(".user_info_change_btn").removeClass("user_info_text_in");
        }
        if(user_pas_change_form.value && user_pas_confirmation_change_form.value){
            if(user_pas_change_form.value != user_pas_confirmation_change_form.value){
                $(this).parents(".user_pass_change_form_area").addClass("pass_not_equal");
            }else{
                $(this).parents(".user_pass_change_form_area").removeClass("pass_not_equal");
            }
        }else{
            $(this).parents(".user_pass_change_form_area").removeClass("pass_not_equal");
        }
    });  
    $(".user_info_form").on('focusout', function(){
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".user_info_change_form").find(".user_info_change_btn").removeClass("user_info_text_in");
        }
    });
    // テキストエリアに入力された時にコメント返信ボタンを有効にする
    $(".content_textarea").on('input', function(){
        $(this).parents(".main_replay").addClass("textarea_in_text");
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".main_replay").removeClass("textarea_in_text");
        }
    });  
    $(".content_textarea").on('focusout', function(){
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".main_replay").removeClass("textarea_in_text");
        }
    });
    // ログインしていないときにコメントテキストエリアを押した反応
    $(".no_login_content_textarea").attr('readonly',true);
    $(".no_login_content_textarea").on('focus', function(){
        var all = $(this).parents('#all');
        all.addClass('no_login_content_textarea_open');
    });  
    $('.no_login_content_textarea_x_btn').on('click', function(){
        var all = $(this).parents('#all');
        all.removeClass('no_login_content_textarea_open');
    });
    $('.no_login_content_textarea_cover').on('click', function(){
        var all = $(this).parents('#all');
        all.removeClass('no_login_content_textarea_open');
    });
    
    // 特に好きな漫画のインプットに入力されていなければログインボタンを無効にする
    $(".best_comic_form").on('input', function(){
        let best_comic_form_1 = document.querySelector(".best_comic_form_1");
        let best_comic_form_2 = document.querySelector(".best_comic_form_2");
        let best_comic_form_3 = document.querySelector(".best_comic_form_3");
        if(best_comic_form_1.value && best_comic_form_2.value && best_comic_form_3.value){
            $(this).parents(".best_comics_change_form").find(".best_comics_change_btn").addClass("best_comics_text_in");
        }
        if( !best_comic_form_1.value || !best_comic_form_2.value || !best_comic_form_3.value || !best_comic_form_1.value.match(/\S/g) || !best_comic_form_2.value.match(/\S/g) || !best_comic_form_3.value.match(/\S/g)){
            $(this).parents(".best_comics_change_form").find(".best_comics_change_btn").removeClass("best_comics_text_in");
        }
    });
    $(".best_comic_form").on('focusout', function(){
        let best_comic_form_1 = document.querySelector(".best_comic_form_1");
        let best_comic_form_2 = document.querySelector(".best_comic_form_2");
        let best_comic_form_3 = document.querySelector(".best_comic_form_3");
        if( !best_comic_form_1.value || !best_comic_form_2.value || !best_comic_form_3.value || !best_comic_form_1.value.match(/\S/g) || !best_comic_form_2.value.match(/\S/g) || !best_comic_form_3.value.match(/\S/g)){
            $(this).parents(".best_comics_change_form").find(".best_comics_change_btn").removeClass("best_comics_text_in");
        }
    });
    // 履修済み漫画のインプットに入力されていなければログインボタンを無効にする
    $(".know_comic_form").on('input', function(){
        $(this).parents(".know_comics_change_form").find(".know_comics_change_btn").addClass("know_comics_text_in");
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".know_comics_change_form").find(".know_comics_change_btn").removeClass("know_comics_text_in");
        }
    });  
    $(".know_comic_form").on('focusout', function(){
        if (!this.value || !this.value.match(/\S/g)) {
            $(this).parents(".know_comics_change_form").find(".know_comics_change_btn").removeClass("know_comics_text_in");
        }
    });
    // ログインのインプットに入力されていなければログインボタンを無効にする
    $(".login_show_form").on('input', function(){
        let login_show_form_name = document.querySelector(".login_show_form_name");
        let login_show_form_password = document.querySelector(".login_show_form_password");
        if(login_show_form_name.value && login_show_form_password.value){
            $(this).parents(".login_form_area").find(".login_btn").addClass("login_input_in_text");
        }
        if( !login_show_form_name.value || !login_show_form_password.value || !login_show_form_name.value.match(/\S/g) || !login_show_form_password.value.match(/\S/g)){
            $(this).parents(".login_form_area").find(".login_btn").removeClass("login_input_in_text");
        }
    });
    $(".login_show_form").on('focusout', function(){
        let login_show_form_name = document.querySelector(".login_show_form_name");
        let login_show_form_password = document.querySelector(".login_show_form_password");
        if(!login_show_form_name.value || !login_show_form_password.value || !login_show_form_name.value.match(/\S/g) || !login_show_form_password.value.match(/\S/g)){
            $(this).parents(".login_form_area").find(".login_btn").removeClass("login_input_in_text");
        }

    });
    // 新規登録のインプットに入力されていなければログインボタンを無効にする
    $(".shinki_show_form").on('input', function(){
        let shinki_show_form_name = document.querySelector(".shinki_show_form_name");
        let shinki_show_password = document.querySelector(".shinki_show_password");
        let shinki_show_form_password_confirmation = document.querySelector(".shinki_show_form_password_confirmation");
        if(shinki_show_form_name.value && shinki_show_password.value && shinki_show_form_password_confirmation.value){
            $(this).parents(".shinki_form_area").find(".shinki_btn").addClass("shinki_input_in_text");
        }
        if( !shinki_show_form_name.value || !shinki_show_password.value || !shinki_show_form_password_confirmation.value || !shinki_show_form_name.value.match(/\S/g) || !shinki_show_password.value.match(/\S/g) || !shinki_show_form_password_confirmation.value.match(/\S/g)){
            $(this).parents(".shinki_form_area").find(".shinki_btn").removeClass("shinki_input_in_text");
        }
        if(shinki_show_password.value && shinki_show_form_password_confirmation.value){
            if(shinki_show_password.value != shinki_show_form_password_confirmation.value){
                $(this).parents(".shinki_form_area").addClass("pass_not_equal");
            }else{
                $(this).parents(".shinki_form_area").removeClass("pass_not_equal");
            }
        }else{
            $(this).parents(".shinki_form_area").removeClass("pass_not_equal");
        }
        if( shinki_show_form_name.value.length > 30){
            $(this).parents(".shinki_form_area").addClass("shinki_name_length_over");
        }else{
            $(this).parents(".shinki_form_area").removeClass("shinki_name_length_over");
        }
    });
    $(".shinki_show_form").on('focusout', function(){
        let shinki_show_form_name = document.querySelector(".shinki_show_form_name");
        let shinki_show_password = document.querySelector(".shinki_show_password");
        let shinki_show_form_password_confirmation = document.querySelector(".shinki_show_form_password_confirmation");
        if( !shinki_show_form_name.value || !shinki_show_password.value || !shinki_show_form_password_confirmation.value || !shinki_show_form_name.value.match(/\S/g) || !shinki_show_password.value.match(/\S/g) || !shinki_show_form_password_confirmation.value.match(/\S/g)){
            $(this).parents(".shinki_form_area").find(".shinki_btn").removeClass("shinki_input_in_text");
        }
    });
    // 新規投稿に情報が入力されなければ投稿ボタンを無効にする
    $(".new_post_textarea").on('input', function(){
        let select = document.querySelector(".new_post_comic_name_select_tag");
        let new_post_tittle_textarea = document.querySelector(".new_post_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".new_post_content_textarea");
        if( select.value && new_post_tittle_textarea.value && new_post_content_textarea.value){
            $(".new_post_form_content").addClass("textareas_in_text");
        }
        if( !select.value || !new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".new_post_form_content").removeClass("textareas_in_text");
        }
    });
    $(".new_post_textarea").on('focusout', function(){
        let select = document.querySelector(".new_post_comic_name_select_tag");
        let new_post_tittle_textarea = document.querySelector(".new_post_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".new_post_content_textarea");
        if( !select.value || !new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".new_post_form_content").removeClass("textareas_in_text");
        }
    });
        $(".new_post_comic_name_select_tag").on('change',function(){
        let select = document.querySelector(".new_post_comic_name_select_tag");
        let new_post_tittle_textarea = document.querySelector(".new_post_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".new_post_content_textarea");
        if( select.value && new_post_tittle_textarea.value && new_post_content_textarea.value){
            $(".new_post_form_content").addClass("textareas_in_text");
        }
        if( !select.value || !new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".new_post_form_content").removeClass("textareas_in_text");
        }
    });
    // 編集情報が入力されなければ投稿ボタンを無効にする
    $(".edit_form").on('input', function(){
        // let select = document.querySelector(".comic_name_select_tag_edit");
        let new_post_tittle_textarea = document.querySelector(".edit_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".edit_content_textarea");
        if( new_post_tittle_textarea.value && new_post_content_textarea.value){
            $(".edit_submit").addClass("textareas_in_text");
        }
        if( !new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".edit_submit").removeClass("textareas_in_text");
        }
    });
    $(".edit_form").on('focusout', function(){
        // let select = document.querySelector(".comic_name_select_tag_edit");
        let new_post_tittle_textarea = document.querySelector(".edit_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".edit_content_textarea");
        if(!new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".edit_submit").removeClass("textareas_in_text");
        }
    });
        $(".comic_name_select_tag_edit").on('change',function(){
        let select = document.querySelector(".comic_name_select_tag_edit");
        let new_post_tittle_textarea = document.querySelector(".edit_tittle_textarea");
        let new_post_content_textarea = document.querySelector(".edit_content_textarea");
        if( !select.value || !new_post_tittle_textarea.value || !new_post_content_textarea.value || !new_post_tittle_textarea.value.match(/\S/g) || !new_post_content_textarea.value.match(/\S/g)){
            $(".edit_submit").removeClass("textareas_in_text");
        }
        if( select.value && new_post_tittle_textarea.value && new_post_content_textarea.value){
            $(".edit_submit").addClass("textareas_in_text");
        }
    });
    $('a.jquery-disabled').on('click',function() { 
        return false; 
    });
    

}); 

