Class {
	#name : #ChInitiation,
	#superclass : #Object,
	#instVars : [
		'question',
		'clarification'
	],
	#category : #'Chatlog-Analysis-Model'
}

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
ChInitiation >> question [
	^ question
]

{ #category : #accessing }
ChInitiation >> question: anObject [
	question := anObject
]
