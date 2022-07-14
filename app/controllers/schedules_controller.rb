class SchedulesController < ApplicationController
 def index
  @schedules = Schedule.all
 end
         
 def new
  @schedules = Schedule.new
 end
         
 def create
  @schedules = Schedule.new(params.permit(:title,:start,:end,:day,:memo,:id,:updated_at))
   if @schedules.save
    flash[:notice] = "スケジュールを新規登録しました"
    redirect_to :schedules
   else
    render "new"
   end
 end
         
 def show
  @schedule = Schedule.find(params[:id])
 end
         
 def edit
  @schedule = Schedule.find(params[:id])
 end
         
 def update
  @schedule = Schedule.find(params[:id])
   if @schedule.update(params.permit(:title,:start,:end,:day,:memo))
    flash[:notice] = "スケジュールを編集しました"
    redirect_to :schedules
   else
    render "edit"
   end
  end
         
  def destroy
   @schedule = Schedule.find(params[:id])
   @schedule.destroy
   flash[:notice] = "スケジュールを削除しました"
   redirect_to :schedules
  end  
end
