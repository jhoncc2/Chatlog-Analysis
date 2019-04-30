Class {
	#name : #ChMessages,
	#superclass : #ChCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'gt-extension' }
ChMessages >> gtLiveFor: aView [
	<gtView>
	(self messages isNil or: [ self messages isEmpty ])
		ifTrue: [ ^ aView empty ].
	^ aView empty 
]
