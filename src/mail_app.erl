%%%-------------------------------------------------------------------
%% @doc mail public API
%% @end
%%%-------------------------------------------------------------------

-module(mail_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    mail_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
