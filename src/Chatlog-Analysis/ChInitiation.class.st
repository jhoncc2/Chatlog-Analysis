Class {
	#name : #ChInitiation,
	#superclass : #ChModel,
	#instVars : [
		'question',
		'clarification'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChInitiation class >> conversationPartSymbol [
	^ #isInitiation
]

{ #category : #'gt-extension' }
ChInitiation >> chChildrenToDisplay [
	| aCollection |
	aCollection := OrderedCollection new: 2.
	self question ifNotNil: [ aCollection add: self question ].
	self clarification ifNotNil: [ aCollection add: self clarification ].
	^ aCollection
	
]

{ #category : #accessing }
ChInitiation >> clarification [
	^ clarification
]

{ #category : #accessing }
ChInitiation >> clarification: anObject [
	clarification := anObject
]

{ #category : #accessing }
ChInitiation >> fromAnalyzedMessages: analyzedMessages [
	super fromAnalyzedMessages: analyzedMessages.
	self question: (ChQuestion fromAnalyzedMessages: analyzedMessages ).
	self clarification: (ChQuestionClarification fromAnalyzedMessages: analyzedMessages) .
	
	self question ifNil: [ self halt. ].
	

]

{ #category : #accessing }
ChInitiation >> gtLiveFor: aView [
	<gtView>
	self question ifNil: [ ^ aView empty ].
	^ self question gtLiveFor: aView
]

{ #category : #accessing }
ChInitiation >> printOn: aStream [
	aStream nextPutAll: 'Initiation with '.	
	self question ifNotNil: [ aStream nextPutAll: 'a question, ' ].
	self clarification ifNotNil: [ aStream nextPutAll: 'a clarification' ].
	
]

{ #category : #accessing }
ChInitiation >> question [
	^ question
]

{ #category : #accessing }
ChInitiation >> question: anObject [
	question := anObject
]
