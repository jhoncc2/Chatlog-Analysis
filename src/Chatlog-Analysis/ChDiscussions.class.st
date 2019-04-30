Class {
	#name : #ChDiscussions,
	#superclass : #ChCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'gt-extension' }
ChDiscussions >> gtLiveFor: aView [
	<gtView>
	| theMessages |
	theMessages := self messages.
	(theMessages isNil or: [ theMessages isEmpty ])
		ifTrue: [ ^ aView empty ].
	^ theMessages gtLiveFor: aView
]

{ #category : #accessing }
ChDiscussions >> messages [
	<return: #DSMessages>
	^ DSMessages streamContents: [ :aStream | 
		self do: [ :eachDiscussion | 
			aStream nextPutAll: eachDiscussion messages ].
	]
]
