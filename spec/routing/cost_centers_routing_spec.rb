require "spec_helper"

describe CostCentersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cost_centers" }.should route_to(:controller => "cost_centers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cost_centers/new" }.should route_to(:controller => "cost_centers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cost_centers/1" }.should route_to(:controller => "cost_centers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cost_centers/1/edit" }.should route_to(:controller => "cost_centers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cost_centers" }.should route_to(:controller => "cost_centers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cost_centers/1" }.should route_to(:controller => "cost_centers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cost_centers/1" }.should route_to(:controller => "cost_centers", :action => "destroy", :id => "1")
    end

  end
end
