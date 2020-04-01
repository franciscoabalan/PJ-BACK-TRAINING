class RentPolicy < ApplicationPolicy
  def index?
    @record.present? && @user.present? && @record.map { |record| record.user == @user }.all?
  end

  def create?
    @record.present? && @user.present? && @record.user == @user
  end
end
