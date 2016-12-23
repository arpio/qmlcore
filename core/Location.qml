/// Window location object
Object {
	property string hash;			///< contains current hash value (after '#' charachter)
	property string host;			///< current host with port number
	property string href;			///< whole current URL
	property string port;			///< current port number
	property string origin;			///< current protocol, hostname and port number of a URL
	property string hostname;		///< current host name
	property string pathname;		///< path name of the current URL
	property string historyState;	///< current history state

	/// @private
	constructor: {
		var self = this
		var location = window.location
		window.onhashchange = function() { self.hash = location.hash }
		window.onpopstate = function() { self.updateActualValues() }
	}

	/// @private
	updateActualValues: {
		this.hash = window.location.hash
		this.host = window.location.host
		this.href = window.location.href
		this.port = window.location.port
		this.origin = window.location.origin
		this.hostname = window.location.hostname
		this.pathname = window.location.pathname

		var state = window.history.state
		this.historyState = (typeof state === "string") ? state : JSON.stringify(state)
	}

	///change current href value method, argument is new href value
	changeHref(href): {
		window.location.href = href
		this.updateActualValues()
	}

	///push new state to the history
	pushState(state, title, url): {
		window.history.pushState(state, title, url)
		this.updateActualValues()
	}
}
