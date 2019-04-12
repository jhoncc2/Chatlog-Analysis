Class {
	#name : #ChExamples,
	#superclass : #Object,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #conversation }
ChExamples >> conversationWithThreeMessages [
	<gtExample>
	| aConversation anInitiation aDiscussion anEnding aMessages aQuestion anAnswer |
	aMessages := self threeMessages.
	aConversation := self emptyConversation.
	anInitiation := self emptyInitiation.
	aDiscussion := self emptyDiscussion.
	anEnding := self emptyEnding.
	aQuestion := self emptyQuestion.
	aQuestion addMessage: aMessages first.
	anInitiation question: aQuestion.
	anAnswer := self emptyAnswer.
	anAnswer addMessage: aMessages second.
	aDiscussion answer: anAnswer.
	anEnding addMessage: aMessages third.
	aConversation initiation: anInitiation.
	aConversation addDiscussion: aDiscussion.
	aConversation ending: anEnding.
	self assert: aConversation initiation equals: anInitiation.
	self assert: aConversation numberOfDiscussions equals: 1.
	self assert: aConversation discussions first equals: aDiscussion.
	self assert: aConversation ending equals: anEnding.
	^ aConversation
]

{ #category : #csv }
ChExamples >> csvThreeAnalyzedMessages [
	<gtExample>
	^ 'id,parentId,conversation coding,key-concept,Component,Descriptor-Component,sentence coding,Comment,date,author,message,,
162164,0,1,"array, data structures",s,l,msqdqux,,14-May-17 07:20,oleks#8268,"Hello, I have two questions about arrays and data structures, , 1. Is there a way of getting  a range of elements?, I was looking for something like, ```, #($a $b $c $d) from: 2 to: 3. ""#($b $c)"", ''abcd'' from: 2 to: 3. ""''bc'' or #($b $c)?"" , ```, 2. Is there a collection that wouldn''t allow adding elements of different types?, ```, #(1 0.1 #x)., { 1 . 0.1 . #x }., ```, I am thinking about the columns in a tabular dataset. Normally, they should have homogeneous data",,
162164,0,2,,s,,ms,,14-May-17 08:07,Latsabben#8293,"@oleks#8268 1) #copyFrom:to:  `#(x y z ) copyFrom: 2 to: 3 """"#(#y #z)""""` 2) only ByteArray and the likes",,
162164,0,5,,,,,,14-May-17 09:09,oleks#8268,"Thank you, @Latsabben#8293",,
'
]

{ #category : #conversation }
ChExamples >> emptyAnswer [
	<gtExample>
	| anAnswer |
	anAnswer := ChAnswer new.
	self assert: anAnswer messages isNotNil.
	self assert: anAnswer numberOfMessages equals: 0.
	^ anAnswer
]

{ #category : #conversation }
ChExamples >> emptyConversation [
	<gtExample>
	| aConversation |
	aConversation := ChConversation new.
	self assert: aConversation initiation isNil.
	self assert: aConversation discussions isNotNil.
	self assert: aConversation discussions isEmpty.
	self assert: aConversation numberOfDiscussions equals: 0.
	self assert: aConversation ending isNil.
	^ aConversation
]

{ #category : #conversation }
ChExamples >> emptyDiscussion [
	<gtExample>
	| aDiscussion |
	aDiscussion := ChDiscussion new.
	self assert: aDiscussion answer isNil.
	self assert: aDiscussion clarification isNil.
	^ aDiscussion
]

{ #category : #conversation }
ChExamples >> emptyEnding [
	<gtExample>
	| anEnding |
	anEnding := ChEnding new.
	self assert: anEnding messages isNotNil.
	self assert: anEnding numberOfMessages equals: 0.
	^ anEnding
]

{ #category : #conversation }
ChExamples >> emptyInitiation [
	<gtExample>
	| anInitiation |
	anInitiation := ChInitiation new.
	self assert: anInitiation question isNil.
	self assert: anInitiation clarification isNil.
	^ anInitiation
]

{ #category : #conversation }
ChExamples >> emptyQuestion [
	<gtExample>
	| aQuestion |
	aQuestion := ChQuestion new.
	self assert: aQuestion messages isNotNil.
	self assert: aQuestion numberOfMessages equals: 0.
	^ aQuestion
]

{ #category : #json }
ChExamples >> jsonThreeMessages [
	<gtExample>
	^  '[{"id":"313301891805347840","channel_id":"305208145020715019","author":{"id":"301667550540857345","username":"oleks","discriminator":"8268","avatar":"2ac4e7b05e0328792aaaf351322dab25","bot":false,"verified":false},"content":"Thank you, <@228244524080562176>","timestamp":"2017-05-14T13:09:51.874+00:00","tts":false,"mention_everyone":false,"mentions":[{"id":"228244524080562176","username":"Latsabben","discriminator":"8293","bot":false,"verified":false}],"mention_roles":[],"attachments":[],"embeds":[],"pinned":false,"type":0},{"id":"313274427087519744","channel_id":"305208145020715019","author":{"id":"301667550540857345","username":"oleks","discriminator":"8268","avatar":"2ac4e7b05e0328792aaaf351322dab25","bot":false,"verified":false},"content":"Hello\nI have two questions about arrays and data structures\n\n1. Is there a way of getting  a range of elements?\nI was looking for something like\n```\n#($a $b $c $d) from: 2 to: 3. \"#($b $c)\"\n''abcd'' from: 2 to: 3. \"''bc'' or #($b $c)?\" \n```\n2. Is there a collection that wouldn''t allow adding elements of different types?\n```\n#(1 0.1 #x).\n{ 1 . 0.1 . #x }.\n```\nI am thinking about the columns in a tabular dataset. Normally, they should have homogeneous data","timestamp":"2017-05-14T11:20:43.775+00:00","edited_timestamp":"2017-05-14T11:22:41.715+00:00","tts":false,"mention_everyone":false,"mentions":[],"mention_roles":[],"attachments":[],"embeds":[],"pinned":false,"type":0},{"id":"313286265896435713","channel_id":"305208145020715019","author":{"id":"228244524080562176","username":"Latsabben","discriminator":"8293","bot":false,"verified":false},"content":"<@301667550540857345> 1) #copyFrom:to:  `#(x y z ) copyFrom: 2 to: 3 \"#(#y #z)\"` 2) only ByteArray and the likes","timestamp":"2017-05-14T12:07:46.367+00:00","tts":false,"mention_everyone":false,"mentions":[{"id":"301667550540857345","username":"oleks","discriminator":"8268","avatar":"2ac4e7b05e0328792aaaf351322dab25","bot":false,"verified":false}],"mention_roles":[],"attachments":[],"embeds":[],"pinned":false,"type":0}]'
]

{ #category : #csv }
ChExamples >> threeAnalyzedMessages [
	<gtExample>
	^ ChAnalyzedMessagesImporter new readString: self csvThreeAnalyzedMessages
]

{ #category : #messages }
ChExamples >> threeMessages [
	<gtExample>
	| aMessages |
	aMessages := DSModelJsonMapping readMessages: self jsonThreeMessages.
	self assert: aMessages size equals: 3.
	^ aMessages
]
