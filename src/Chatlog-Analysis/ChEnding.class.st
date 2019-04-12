Class {
	#name : #ChEnding,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #adding }
ChEnding >> addMessage: aDSMessage [
	self messages addLast: aDSMessage
]

{ #category : #initialization }
ChEnding >> initialize [
	super initialize.
	messages := OrderedCollection new: 1.
]

{ #category : #accessing }
ChEnding >> messages [
	^ messages
]

{ #category : #accessing }
ChEnding >> messages: anObject [
	messages := anObject
]

{ #category : #convenience }
ChEnding >> numberOfMessages [
	^ self messages ifNotNil: #size ifNil: 0
]
