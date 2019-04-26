Class {
	#name : #ChDiscussion,
	#superclass : #ChModel,
	#instVars : [
		'answer',
		'clarification',
		'ending'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChDiscussion class >> conversationPartSymbol [
	^ #isDiscussion
]

{ #category : #accessing }
ChDiscussion >> answer [
	^ answer
]

{ #category : #accessing }
ChDiscussion >> answer: anObject [
	answer := anObject
]

{ #category : #'gt-extension' }
ChDiscussion >> chChildrenToDisplay [
	| aCollection |
	aCollection := OrderedCollection new: 2.
	self answer ifNotNil: [ aCollection add: self answer ].
	self clarification ifNotNil: [ aCollection add: self clarification ].
	self ending ifNotNil: [ aCollection add: self ending ].
	^ aCollection
	
]

{ #category : #accessing }
ChDiscussion >> clarification [
	^ clarification
]

{ #category : #accessing }
ChDiscussion >> clarification: anObject [
	clarification := anObject
]

{ #category : #accessing }
ChDiscussion >> ending [
	^ ending
]

{ #category : #accessing }
ChDiscussion >> ending: anObject [
	ending := anObject
]

{ #category : #'import-msgs' }
ChDiscussion >> fromAnalyzedMessages: analyzedMessages [
	super fromAnalyzedMessages: analyzedMessages.
	self answer: (ChAnswer fromAnalyzedMessages: analyzedMessages ).
	self clarification: (ChAnswerClarification fromAnalyzedMessages: analyzedMessages).
	self ending: (ChEnding fromAnalyzedMessages: analyzedMessages).
]

{ #category : #accessing }
ChDiscussion >> initialize [
	super initialize.
	clarification := nil.
	answer := nil.
	ending := nil.
	
]

{ #category : #accessing }
ChDiscussion >> printOn: aStream [
	aStream nextPutAll: 'Discussion with '.	
	self answer ifNotNil: [ aStream nextPutAll: 'an answer, ' ].
	self clarification ifNotNil: [ aStream nextPutAll: 'a clarification, '].
	self ending ifNotNil: [ aStream nextPutAll: ' and an ending'].
	
]
