# config.ru
require './config/environment'

use ForecastsController
run ApplicationController

$stdout.sync = true

set :environment, :production
