Class {
	#name : #ChMessagesCollection,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #adding }
ChMessagesCollection >> addMessage: aDSMessage [
	self messages addLast: aDSMessage
]

{ #category : #'gt-extension' }
ChMessagesCollection >> chChildrenToDisplay [
	self messages ifNotNil: [ ^ self messages ].
	^ Array empty
]

{ #category : #initialization }
ChMessagesCollection >> initialize [
	super initialize.
	messages := DSMessages new: 1.
]

{ #category : #accessing }
ChMessagesCollection >> messages [
	^ messages
]

{ #category : #accessing }
ChMessagesCollection >> messages: anObject [
	messages := anObject
]

{ #category : #convenience }
ChMessagesCollection >> numberOfMessages [
	^ self messages ifNotNil: #size ifNil: 0
]
