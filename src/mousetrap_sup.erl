-module(mousetrap_sup).
-behaviour(supervisor).

-export([start_link/0, stop/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop() ->
  ok.

init([]) ->
  {ok, Pins} = application:get_env(mousetrap, pins),
  case Pins of
    [] ->
      {error, no_pins_to_watch};
    _ ->
      {ok, {one_for_one, _MaxRestart = 1, _MaxTime = 1}, []}
  end.