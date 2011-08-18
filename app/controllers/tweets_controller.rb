# coding: utf-8

class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end

  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @tweet = Tweet.new(params[:tweet])
    puts "-----"
    p @tweet
    puts "----------"
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to(:action => :index, :notice => 'Tweet was successfully created.') }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
end
