Class {
	#name : #ChConversation,
	#superclass : #Object,
	#instVars : [
		'initiation',
		'discussions',
		'ending'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #convenient }
ChConversation >> addDiscussion: aChDiscussion [
	self discussions addLast: aChDiscussion
]

{ #category : #accessing }
ChConversation >> discussions [
	^ discussions
]

{ #category : #accessing }
ChConversation >> discussions: anObject [
	discussions := anObject
]

{ #category : #accessing }
ChConversation >> ending [
	^ ending
]

{ #category : #accessing }
ChConversation >> ending: anObject [
	ending := anObject
]

{ #category : #initialization }
ChConversation >> initialize [
	super initialize.
	discussions := OrderedCollection new: 1.
	ending := nil.
	initiation := nil.
]

{ #category : #accessing }
ChConversation >> initiation [
	^ initiation
]

{ #category : #accessing }
ChConversation >> initiation: anObject [
	initiation := anObject
]

{ #category : #convenient }
ChConversation >> numberOfDiscussions [
	^ self discussions ifNotNil: #size ifNil: 0
]
