class ReportsController < ApplicationController
    
    def create
    @post = Post.find_by(id:params[:id])
    @report = Report.new(reporter_id:@current_user.try(:id), kind:params[:kind], violator_id:@post.user_id, content:@post.content)
    if @report.save
        flash[:notice] = "通報しました"
        redirect_to("/home/top")
    else
        flash[:notice] = "内容の送信に失敗しました"
        render("posts/report")
    end
    end

end