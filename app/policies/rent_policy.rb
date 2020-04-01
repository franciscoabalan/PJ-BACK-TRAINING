class RentPolicy < ApplicationPolicy
  def index?
    @record.present? && @user.present? && @record.map { |record| record.user == @user }.all?
  end

  def create?
    @user.present?
  end
end
