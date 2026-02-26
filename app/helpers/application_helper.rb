module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type.to_s
    when "notice" then "success"
    when "alert"  then "danger"
    else "info"
    end
  end
end
