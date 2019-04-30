Class {
	#name : #ChConversations,
	#superclass : #ChCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'gt-extension' }
ChConversations >> gtConversationsFor: aView [
	<gtView>
	^ aView tree 
		title: 'Conversations';
		priority: 1;
		items: [ self ];
		children: [ :item | item chChildrenToDisplay ]
]
