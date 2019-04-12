Class {
	#name : #ChDiscussion,
	#superclass : #Object,
	#instVars : [
		'answer',
		'clarification'
	],
	#category : #'Chatlog-Analysis-Model'
}

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
