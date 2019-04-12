Class {
	#name : #BaselineOfChatlogAnalysis,
	#superclass : #BaselineOf,
	#category : #BaselineOfChatlogAnalysis
}

{ #category : #baselines }
BaselineOfChatlogAnalysis >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'DiscordSt' with: [
				spec repository: 'github://JurajKubelka/DiscordSt/src' ];
			baseline: 'NeoCSV' with: [
				spec repository: 'github://sven/NeoCSV/repository' ].
		spec package: 'Chatlog-Analysis' with: [ 
			spec requires: #( 'DiscordSt' 'NeoCSV' ) ].
	]
]
