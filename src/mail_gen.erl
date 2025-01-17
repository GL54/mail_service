-module(mail_gen).
-behaviour(gen_server).

%% API
-export([ stop/0, start_link/0,send_mail/4]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-record(state, {dummy}).
stop() ->
    gen_server:call(?MODULE, stop).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
send_mail(From,Mail,Subject,Body)->
  gen_smtp_client:send({"_", [Mail],
 "Subject: "++Subject++"\r\nFrom: "++From++"\r\n\r\n"++Body},
  [{relay, "smtp.gmail.com"}, {username, "devilsok8@gmail.com"}, {password, "pwtxczgmpvxewqeb"}]).
init(_Args) ->
    {ok, #state{dummy=1}}.

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
