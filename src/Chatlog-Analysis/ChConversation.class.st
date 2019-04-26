Class {
	#name : #ChConversation,
	#superclass : #ChModel,
	#instVars : [
		'initiation',
		'discussions'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChConversation class >> conversationPartSymbol [
	^ #isConversation
]

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
ChConversation >> fromAnalyzedMessages: analyzedMessages [
	| dscs |
	self initiation: (ChInitiation fromAnalyzedMessages: analyzedMessages).
	dscs := analyzedMessages groupedBy: [ :e | e subConversationId ].
	self discussions addAll: (dscs associations collect: [ :e | ChDiscussion fromAnalyzedMessages: e value]).
	
	"sanitize"
	self discussions: (self discussions reject: #isNil)
]

{ #category : #accessing }
ChConversation >> gtConversationFor: aView [
	<gtView>
	^ aView tree 
		title: 'Conversation';
		items: [ { self } ];
		children: [ :item | item chChildrenToDisplay ]
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
	discussions := ChDiscussions new: 1.
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
		nextPutAll: ' discussions '  ].
	
]
