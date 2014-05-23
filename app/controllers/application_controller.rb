class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@groups = {
  		#'A' => Team.where(group_id: Group.find_by(letter: 'A').id).order('name ASC'),
  		'A' => {teams: Group.find_by(letter: 'A').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'A').matches.order('date ASC')},
  		'B' => {teams: Group.find_by(letter: 'B').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'B').matches.order('date ASC')},
  		'C' => {teams: Group.find_by(letter: 'C').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'C').matches.order('date ASC')},
  		'D' => {teams: Group.find_by(letter: 'D').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'D').matches.order('date ASC')},
  		'E' => {teams: Group.find_by(letter: 'E').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'E').matches.order('date ASC')},
  		'F' => {teams: Group.find_by(letter: 'F').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'F').matches.order('date ASC')},
  		'G' => {teams: Group.find_by(letter: 'G').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'G').matches.order('date ASC')},
  		'H' => {teams: Group.find_by(letter: 'H').teams.order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC'), matches: Group.find_by(letter: 'H').matches.order('date ASC')}
  	}

    @nextmatch = Match.where(team1_goals: nil, team2_goals: nil).order('date ASC').limit(1).first
    @recent_results = Match.where('team1_goals is not null AND team2_goals is not null').order('date DESC').limit(5)
    @nextmatch = @recent_results.first if @nextmatch.nil?

  end
end
