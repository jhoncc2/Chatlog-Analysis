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

{ #category : #accessing }
ChDiscussion >> clarification [
	^ clarification
]

{ #category : #accessing }
ChDiscussion >> clarification: anObject [
	clarification := anObject
]
