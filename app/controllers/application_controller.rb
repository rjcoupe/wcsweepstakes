class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@groups = {
  		#'A' => Team.where(group_id: Group.find_by(letter: 'A').id).order('name ASC'),
  		'A' => {teams: Group.find_by(letter: 'A').teams.order('qpoints DESC'), matches: Group.find_by(letter: 'A').matches.order('date ASC')},
  		'B' => {teams: Group.find_by(letter: 'B').teams},
  		'C' => {teams: Group.find_by(letter: 'C').teams},
  		'D' => {teams: Group.find_by(letter: 'D').teams},
  		'E' => {teams: Group.find_by(letter: 'E').teams},
  		'F' => {teams: Group.find_by(letter: 'F').teams},
  		'G' => {teams: Group.find_by(letter: 'G').teams},
  		'H' => {teams: Group.find_by(letter: 'H').teams}
  	}


  end
end
