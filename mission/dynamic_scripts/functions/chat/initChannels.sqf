[_this, {
	params ["_player", "_old"];

	private _custom_channels = missionNamespace getVariable "chat_customChannels";

	if (isNil "_custom_channels") then {
		_RPCID				= radioChannelCreate [[0.10, 0.0, 1, 1],		"RP Channel",	"<%CHANNEL_LABEL> %UNIT_NAME", [], false];
		_NRPCID				= radioChannelCreate [[0.95, 0.10, 0.10, 1],	"NRP Channel",	"<%CHANNEL_LABEL> %UNIT_NAME", [], false];
		_custom_channels	= [_RPCID, _NRPCID];
	};

	missionNamespace setVariable ["chat_customChannels", _custom_channels, true];

	{
		if (!isNil "_old") then {
			_x radioChannelRemove [_old];
		};

		_x radioChannelAdd [_player];
	} forEach _custom_channels;
}] remoteExec ["spawn", 2];