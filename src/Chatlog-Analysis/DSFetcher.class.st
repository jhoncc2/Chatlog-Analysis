Class {
	#name : #DSFetcher,
	#superclass : #Object,
	#instVars : [
		'channels',
		'fileNames',
		'messages'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Chatlog-Analysis-Utils'
}

{ #category : #accessing }
DSFetcher class >> fetchDSmessages [
	self instance messages ifEmpty: [
		self instance fetchData.
	].
	^ self instance messages
]

{ #category : #accessing }
DSFetcher class >> fetchData [
	self instance fetchData
]

{ #category : #accessing }
DSFetcher class >> instance [
	^ instance ifNil: [ instance := DSFetcher new]
]

{ #category : #configuration }
DSFetcher >> channels [
	^ #('tutorial-help' ) "'general' 'iceberg' 'roassal' 'bloc')"
]

{ #category : #actions }
DSFetcher >> fetchDSMessagesOnChannelName: channelName [
	| channel messages last |
	channel := (DSClient newDefault restApi meGuilds select: [ :e | e name = 'Pharo' ]) 
					first channelNamed: channelName.
	messages := OrderedCollection new.

	messages addAll: channel messages.
	last := channel messages last.
	messages addAll: (channel queryMessagesBefore: last).
	
	[last id = messages last id] whileFalse: [
		last := messages last.
		messages addAll: (channel queryMessagesBefore: last).
	].
	^ messages
]

{ #category : #actions }
DSFetcher >> fetchData [
	messages := OrderedCollection new.
	self channels do: [ :c | 
		messages addAll: (self fetchDSMessagesOnChannelName: c)
	].

]

{ #category : #actions }
DSFetcher >> fetchDataAndStoreInJson [
	messages := OrderedCollection new.
	self channels do: [ :c | 
		messages addAll: (self fetchDSMessagesOnChannelName: c)
	].
"
	path := '/home/jhon/Workspace/chatlog-dataset/'.
	fileNames := self channels collect: [ :c | c , '.json' ].
	fileNames doWithIndex: [ :e :i  | 
		(path , e) asFileReference writeStreamDo: [ :stream |
			(NeoJSONWriter on: stream)
		 	    prettyPrint: true;
 		 	    mapInstVarsFor: Point;
  		 	  	 nextPut: (NeoJSONWriter toString: (messages at: i )) 
		]
	]
	

	"
]

{ #category : #accessing }
DSFetcher >> messages [ 
	^ messages ifNil:[ messages := DSMessages empty ]
]

{ #category : #configuration }
DSFetcher >> outputPath [
	^ '/home/jhon/Workspace/chatlog-dataset/'
]

{ #category : #serialize }
DSFetcher >> serializeJson [
	"call serializeMessagesAsJson instead"
	<Deprecated>
	| path |
	path := '/Users/jhonc/Workspace/chatlog/jsonData'.
	fileNames := self channels collect: [ :c | c , '.json' ].
	fileNames doWithIndex: [ :e :i  | 
		(path , e) asFileReference writeStreamDo: [ :stream |
			(NeoJSONWriter on: stream)
		 	    prettyPrint: true;
 				 mapInstVarsFor: DSMessage;
				 mapInstVarsFor: OrderedCollection;
  		 	  	 nextPut: (NeoJSONWriter toString: messages ) 
		]
	]

]

{ #category : #serialize }
DSFetcher >> serializeJson: fileName last: numOfMessages messages: msgs [ 
	<Deprecated>
	| start list |
	start := msgs size - numOfMessages.
	list := msgs copyFrom: start to: msgs size.

	(self outputPath , fileName) asFileReference writeStreamDo: [ :stream |
			(NeoJSONWriter on: stream)
		 	    prettyPrint: true;
				 mapInstVarsFor: DSAttachment;
 				 mapInstVarsFor: DSMessage;
				 mapInstVarsFor: OrderedCollection;
  		 	  	 nextPut: (NeoJSONWriter toString: list ) 
		]
	
]

{ #category : #serialize }
DSFetcher >> serializeMessagesAsJson [
	| path |
	path := '/Users/jhonc/Workspace/chatlog/jsonData/'.
	fileNames := self channels collect: [ :c | c , '.json' ].
	fileNames doWithIndex: [ :e :i  | 
		(path , e) asFileReference writeStreamDo: [ :stream |
			|jsonString|
			jsonString := DSModelJsonMapping write: self messages as: #CollectionOfMessages mappedTo: #collectionOfMessagesMappingFor: .
			stream nextPutAll: jsonString
		]
	]

]
