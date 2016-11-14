##############################################################################
# File::    app.rb
# Purpose:: filedescription
# 
# Author::    Jeff McAffee 11/13/2016
# Copyright:: Copyright (c) 2016, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'net/imap'

module ImapClear
  class App

    attr_accessor :host
    attr_accessor :port
    attr_accessor :user
    attr_accessor :pass
    attr_reader   :imap

    attr_accessor :trashbox
    attr_accessor :inbox


    def initialize
      @inbox = "INBOX"
      @trashbox = "INBOX.Trash"
    end

    def connect
      @imap = Net::IMAP.new(host, port, true, nil, false)
    end

    def login
      @imap.login(user, pass)
    end

    def list_mailboxes
      imap.list("", "*")
    end

    def select_mailbox mailbox
      imap.select(mailbox)
    end

    def get_uids_where_from email_address
      select_mailbox(inbox)
      uids = imap.uid_search(["FROM", email_address])
    end

    def get_uids_where_body_contains value
      select_mailbox(inbox)
      uids = imap.uid_search(["BODY", value])
    end

    def fetch seqno
      imap.fetch(seqno, ["UID","ENVELOPE"])
    end

    def uid_fetch uid
      imap.uid_fetch(uid, "ENVELOPE")
    end

    def subject_line seqno
      imap.fetch(seqno, "BODY[HEADER.FIELDS (SUBJECT)]")
    end

    def delete_uids uids
      $stdout.print "Deleting #{uids.count} emails\n"
      $stdout.flush
      uids.each do |uid|
        imap.uid_copy(uid, trashbox)
        imap.uid_store(uid, "+FLAGS", [:Deleted])
        $stdout.print "."
        $stdout.flush
      end
    end

    def show_envelope_for_uid uid
      imap.uid_fetch(uid, "ENVELOPE")
    end

    def expunge
      imap.expunge
    end

    def disconnect
      imap.disconnect unless imap.disconnected?
    end
  end
end # module

