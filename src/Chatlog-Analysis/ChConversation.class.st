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

{ #category : #'gt-extension' }
ChConversation >> chChildrenToDisplay [
	| aCollection |
	aCollection := OrderedCollection new: 3.
	self initiation ifNotNil: [ aCollection add: self initiation ].
	self discussions ifNotNil: [ aCollection add: self discussions ].
	self ending ifNotNil: [ aCollection add: self ending ].
	^ aCollection
	
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

{ #category : #'gt-extension' }
ChConversation >> gtInspectorConversationIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastTree 
		title: 'Conversation' translated;
		display: [ { self } ];
		children: [ :item | item chChildrenToDisplay ];
		expandedUntil: 1
]

{ #category : #initialization }
ChConversation >> initialize [
	super initialize.
	discussions := ChCollection new: 1.
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

{ #category : #printing }
ChConversation >> printOn: aStream [
	aStream nextPutAll: 'Conversation with '.	
	self initiation ifNotNil: [ aStream nextPutAll: 'an initial question, ' ].
	self discussions ifNotNil: [ aStream 
		print: self numberOfDiscussions;
		nextPutAll: ' discussions, '  ].
	self ending ifNotNil: [ aStream nextPutAll: ' and an ending' ].
]
