Class {
	#name : #ChInitiation,
	#superclass : #Object,
	#instVars : [
		'question',
		'clarification'
	],
	#category : #'Chatlog-Analysis-Model'
}

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
