module ApplicationHelper
  def create_or_update
    submit(self.object.new_record? ? "Create" : "Update" )
  end
end
