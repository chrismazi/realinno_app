import React, { useState, useRef, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  StatusBar,
  Dimensions,
} from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const { width } = Dimensions.get('window');

interface Message {
  id: string;
  content: string;
  type: string;
  isUser: boolean;
  timestamp: Date;
  status?: string;
  quickReplies?: string[];
}

const ChatScreen = () => {
  const scrollViewRef = useRef<ScrollView>(null);
  const [messageText, setMessageText] = useState('');
  const [isTyping, setIsTyping] = useState(false);
  const [isCrisisMode, setIsCrisisMode] = useState(false);
  const [showQuickActions, setShowQuickActions] = useState(true);
  
  const [messages, setMessages] = useState<Message[]>([
    {
      id: '1',
      content: "Hello! I'm your AI wellness companion. I'm here to provide support, coping strategies, and crisis assistance. How are you feeling today?",
      type: 'text',
      isUser: false,
      timestamp: new Date(Date.now() - 120000),
      status: 'delivered',
    },
  ]);

  const quickReplies = [
    "I'm feeling anxious",
    'I need help with stress',
    'Financial worries',
    "I'm in crisis",
  ];

  const quickActions = [
    { id: 'crisis_support', label: 'Crisis Support', icon: '🆘' },
    { id: 'breathing_exercise', label: 'Breathing Exercise', icon: '🫁' },
    { id: 'coping_strategies', label: 'Coping Strategies', icon: '💡' },
    { id: 'financial_help', label: 'Financial Help', icon: '💰' },
  ];

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const scrollToBottom = () => {
    setTimeout(() => {
      scrollViewRef.current?.scrollToEnd({ animated: true });
    }, 100);
  };

  const sendMessage = async (content: string) => {
    if (!content.trim()) return;

    const userMessage: Message = {
      id: Date.now().toString(),
      content: content.trim(),
      type: 'text',
      isUser: true,
      timestamp: new Date(),
      status: 'sent',
    };

    setMessages([...messages, userMessage]);
    setMessageText('');
    setShowQuickActions(false);
    setIsTyping(true);

    // Check for crisis keywords
    const crisisKeywords = ['crisis', 'emergency', 'suicide', 'hurt myself'];
    if (crisisKeywords.some(keyword => content.toLowerCase().includes(keyword))) {
      setIsCrisisMode(true);
    }

    // Simulate AI response
    setTimeout(() => {
      const aiResponse = generateAIResponse(content);
      setMessages(prev => [...prev, aiResponse]);
      setIsTyping(false);
    }, 2000);
  };

  const generateAIResponse = (userMessage: string): Message => {
    const lowerMessage = userMessage.toLowerCase();
    let responseContent = '';
    let quickReplies: string[] | undefined;

    if (lowerMessage.includes('anxious') || lowerMessage.includes('anxiety')) {
      responseContent = "I understand you're feeling anxious. Anxiety is a common experience, and there are effective ways to manage it. Try the 5-4-3-2-1 grounding technique: Name 5 things you can see, 4 you can touch, 3 you can hear, 2 you can smell, and 1 you can taste.";
      quickReplies = ['Tell me more', 'Other techniques', 'I feel better', 'Still anxious'];
    } else if (lowerMessage.includes('stress')) {
      responseContent = 'Stress can be overwhelming. Let me share some strategies that can help you manage it better.';
      quickReplies = ['Breathing exercises', 'Time management tips', 'Relaxation techniques', 'Talk to someone'];
    } else if (lowerMessage.includes('financial') || lowerMessage.includes('money')) {
      responseContent = 'Financial stress is very common. Would you like some practical budgeting tips or emotional support for money worries?';
      quickReplies = ['Budgeting help', 'Reduce expenses', 'Emotional support', 'Emergency resources'];
    } else if (lowerMessage.includes('crisis') || lowerMessage.includes('emergency')) {
      responseContent = "I'm very concerned about what you're going through. Your safety is the most important thing right now. Please consider reaching out to a crisis counselor or emergency services immediately.";
      quickReplies = ['Call emergency services', 'Connect with counselor', 'Crisis resources', "I'm safe for now"];
    } else {
      responseContent = "Thank you for sharing that with me. I'm here to listen and support you. Can you tell me more about what's on your mind?";
      quickReplies = ['I need coping strategies', "I'm feeling overwhelmed", 'I want to talk more', 'Show me resources'];
    }

    return {
      id: Date.now().toString(),
      content: responseContent,
      type: 'text',
      isUser: false,
      timestamp: new Date(),
      status: 'delivered',
      quickReplies,
    };
  };

  const handleQuickAction = (actionId: string) => {
    const actionMessages: { [key: string]: string } = {
      crisis_support: 'I need crisis support',
      breathing_exercise: 'Can you guide me through a breathing exercise?',
      coping_strategies: 'I need some coping strategies',
      financial_help: 'I need help with financial stress',
    };
    sendMessage(actionMessages[actionId] || actionMessages.crisis_support);
  };

  const renderMessage = (message: Message) => (
    <View
      key={message.id}
      style={[
        styles.messageContainer,
        message.isUser ? styles.userMessageContainer : styles.aiMessageContainer,
      ]}
    >
      <View
        style={[
          styles.messageBubble,
          message.isUser ? styles.userMessageBubble : styles.aiMessageBubble,
        ]}
      >
        <Text
          style={[
            styles.messageText,
            message.isUser ? styles.userMessageText : styles.aiMessageText,
          ]}
        >
          {message.content}
        </Text>
      </View>
      {message.quickReplies && (
        <View style={styles.quickRepliesContainer}>
          {message.quickReplies.map((reply, index) => (
            <TouchableOpacity
              key={index}
              style={styles.quickReplyButton}
              onPress={() => sendMessage(reply)}
            >
              <Text style={styles.quickReplyText}>{reply}</Text>
            </TouchableOpacity>
          ))}
        </View>
      )}
    </View>
  );

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      keyboardVerticalOffset={Platform.OS === 'ios' ? 90 : 0}
    >
      <StatusBar barStyle="dark-content" />
      
      {/* Header */}
      <View style={styles.header}>
        <View style={styles.headerContent}>
          <View style={styles.aiIconContainer}>
            <Text style={styles.aiIcon}>🤖</Text>
          </View>
          <View style={styles.headerTextContainer}>
            <Text style={styles.headerTitle}>AI Wellness Support</Text>
            <Text style={styles.headerStatus}>
              {isTyping ? 'Typing...' : 'Online'}
            </Text>
          </View>
        </View>
        <TouchableOpacity style={styles.emergencyButton}>
          <Text style={styles.emergencyIcon}>🆘</Text>
        </TouchableOpacity>
      </View>

      {/* Crisis Mode Banner */}
      {isCrisisMode && (
        <View style={styles.crisisBanner}>
          <Text style={styles.crisisBannerText}>⚠️ Crisis Mode Active</Text>
          <TouchableOpacity onPress={() => setIsCrisisMode(false)}>
            <Text style={styles.crisisDismiss}>✕</Text>
          </TouchableOpacity>
        </View>
      )}

      {/* Messages */}
      <ScrollView
        ref={scrollViewRef}
        style={styles.messagesContainer}
        contentContainerStyle={styles.messagesContent}
        showsVerticalScrollIndicator={false}
      >
        {/* Quick Actions */}
        {showQuickActions && messages.length <= 1 && (
          <View style={styles.quickActionsContainer}>
            <Text style={styles.quickActionsTitle}>Quick Actions</Text>
            <View style={styles.quickActionsGrid}>
              {quickActions.map((action) => (
                <TouchableOpacity
                  key={action.id}
                  style={styles.quickActionCard}
                  onPress={() => handleQuickAction(action.id)}
                >
                  <Text style={styles.quickActionIcon}>{action.icon}</Text>
                  <Text style={styles.quickActionLabel}>{action.label}</Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
        )}

        {messages.map(renderMessage)}

        {/* Typing Indicator */}
        {isTyping && (
          <View style={[styles.messageContainer, styles.aiMessageContainer]}>
            <View style={[styles.messageBubble, styles.aiMessageBubble]}>
              <View style={styles.typingIndicator}>
                <View style={styles.typingDot} />
                <View style={styles.typingDot} />
                <View style={styles.typingDot} />
              </View>
            </View>
          </View>
        )}
      </ScrollView>

      {/* Input Area */}
      <View style={styles.inputContainer}>
        {/* Quick Replies from last AI message */}
        {quickReplies && !isTyping && (
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            style={styles.quickRepliesScroll}
          >
            {quickReplies.map((reply, index) => (
              <TouchableOpacity
                key={index}
                style={styles.quickReplyChip}
                onPress={() => sendMessage(reply)}
              >
                <Text style={styles.quickReplyChipText}>{reply}</Text>
              </TouchableOpacity>
            ))}
          </ScrollView>
        )}

        <View style={styles.inputRow}>
          <TextInput
            style={styles.input}
            value={messageText}
            onChangeText={setMessageText}
            placeholder="Type your message..."
            placeholderTextColor={colors.gray400}
            multiline
            maxLength={500}
          />
          <TouchableOpacity
            style={[
              styles.sendButton,
              !messageText.trim() && styles.sendButtonDisabled,
            ]}
            onPress={() => sendMessage(messageText)}
            disabled={!messageText.trim()}
          >
            <Text style={styles.sendButtonText}>➤</Text>
          </TouchableOpacity>
        </View>
      </View>
    </KeyboardAvoidingView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    backgroundColor: colors.white,
    paddingHorizontal: spacing.md,
    paddingTop: spacing.xl,
    paddingBottom: spacing.sm,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  headerContent: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  aiIconContainer: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.primarySoft,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: spacing.sm,
  },
  aiIcon: {
    fontSize: 20,
  },
  headerTextContainer: {
    flex: 1,
  },
  headerTitle: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  headerStatus: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginTop: 2,
  },
  emergencyButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.error + '20',
    justifyContent: 'center',
    alignItems: 'center',
  },
  emergencyIcon: {
    fontSize: 20,
  },
  crisisBanner: {
    backgroundColor: colors.error,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  crisisBannerText: {
    color: colors.white,
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
  },
  crisisDismiss: {
    color: colors.white,
    fontSize: 18,
    fontWeight: typography.fontWeight.bold,
  },
  messagesContainer: {
    flex: 1,
  },
  messagesContent: {
    padding: spacing.md,
    paddingBottom: spacing.xl,
  },
  quickActionsContainer: {
    marginBottom: spacing.lg,
  },
  quickActionsTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.textSecondary,
    marginBottom: spacing.sm,
  },
  quickActionsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  quickActionCard: {
    width: (width - spacing.md * 2 - spacing.sm) / 2,
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: colors.border,
  },
  quickActionIcon: {
    fontSize: 24,
    marginBottom: spacing.xs,
  },
  quickActionLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.text,
    fontWeight: typography.fontWeight.medium,
    textAlign: 'center',
  },
  messageContainer: {
    marginBottom: spacing.md,
  },
  userMessageContainer: {
    alignItems: 'flex-end',
  },
  aiMessageContainer: {
    alignItems: 'flex-start',
  },
  messageBubble: {
    maxWidth: '80%',
    padding: spacing.sm,
    borderRadius: 12,
  },
  userMessageBubble: {
    backgroundColor: colors.primary,
    borderBottomRightRadius: 4,
  },
  aiMessageBubble: {
    backgroundColor: colors.white,
    borderBottomLeftRadius: 4,
    borderWidth: 1,
    borderColor: colors.border,
  },
  messageText: {
    fontSize: typography.fontSize.sm,
    lineHeight: 20,
  },
  userMessageText: {
    color: colors.white,
  },
  aiMessageText: {
    color: colors.text,
  },
  quickRepliesContainer: {
    marginTop: spacing.sm,
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.xs,
  },
  quickReplyButton: {
    backgroundColor: colors.primarySoft,
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 16,
    borderWidth: 1,
    borderColor: colors.primary + '30',
  },
  quickReplyText: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  typingIndicator: {
    flexDirection: 'row',
    gap: 4,
    padding: 4,
  },
  typingDot: {
    width: 6,
    height: 6,
    borderRadius: 3,
    backgroundColor: colors.gray400,
  },
  inputContainer: {
    backgroundColor: colors.white,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingBottom: Platform.OS === 'ios' ? spacing.lg : spacing.sm,
  },
  quickRepliesScroll: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  quickReplyChip: {
    backgroundColor: colors.primarySoft,
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs,
    borderRadius: 16,
    marginRight: spacing.xs,
    borderWidth: 1,
    borderColor: colors.primary + '30',
  },
  quickReplyChipText: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  inputRow: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    paddingHorizontal: spacing.md,
    paddingTop: spacing.sm,
    gap: spacing.sm,
  },
  input: {
    flex: 1,
    backgroundColor: colors.background,
    borderRadius: 20,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    fontSize: typography.fontSize.sm,
    color: colors.text,
    maxHeight: 100,
    borderWidth: 1,
    borderColor: colors.border,
  },
  sendButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.primary,
    justifyContent: 'center',
    alignItems: 'center',
  },
  sendButtonDisabled: {
    backgroundColor: colors.gray300,
  },
  sendButtonText: {
    color: colors.white,
    fontSize: 18,
    fontWeight: typography.fontWeight.bold,
  },
});

export default ChatScreen;
