class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@groups = {
  		#'A' => Team.where(group_id: Group.find_by(letter: 'A').id).order('name ASC'),
  		'A' => Group.find_by(letter: 'A').teams,
  		'B' => Group.find_by(letter: 'A').teams,
  		'C' => Group.find_by(letter: 'A').teams,
  		'D' => Group.find_by(letter: 'A').teams,
  		'E' => Group.find_by(letter: 'A').teams,
  		'F' => Group.find_by(letter: 'A').teams,
  		'G' => Group.find_by(letter: 'A').teams,
  		'H' => Group.find_by(letter: 'A').teams
  	}


  end
end
