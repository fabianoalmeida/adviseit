require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe CostCentersController do

  def mock_cost_center(stubs={})
    @mock_cost_center ||= mock_model(CostCenter, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all cost_centers as @cost_centers" do
      CostCenter.stub(:all) { [mock_cost_center] }
      get :index
      assigns(:cost_centers).should eq([mock_cost_center])
    end
  end

  describe "GET show" do
    it "assigns the requested cost_center as @cost_center" do
      CostCenter.stub(:find).with("37") { mock_cost_center }
      get :show, :id => "37"
      assigns(:cost_center).should be(mock_cost_center)
    end
  end

  describe "GET new" do
    it "assigns a new cost_center as @cost_center" do
      CostCenter.stub(:new) { mock_cost_center }
      get :new
      assigns(:cost_center).should be(mock_cost_center)
    end
  end

  describe "GET edit" do
    it "assigns the requested cost_center as @cost_center" do
      CostCenter.stub(:find).with("37") { mock_cost_center }
      get :edit, :id => "37"
      assigns(:cost_center).should be(mock_cost_center)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created cost_center as @cost_center" do
        CostCenter.stub(:new).with({'these' => 'params'}) { mock_cost_center(:save => true) }
        post :create, :cost_center => {'these' => 'params'}
        assigns(:cost_center).should be(mock_cost_center)
      end

      it "redirects to the created cost_center" do
        CostCenter.stub(:new) { mock_cost_center(:save => true) }
        post :create, :cost_center => {}
        response.should redirect_to(cost_center_url(mock_cost_center))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cost_center as @cost_center" do
        CostCenter.stub(:new).with({'these' => 'params'}) { mock_cost_center(:save => false) }
        post :create, :cost_center => {'these' => 'params'}
        assigns(:cost_center).should be(mock_cost_center)
      end

      it "re-renders the 'new' template" do
        CostCenter.stub(:new) { mock_cost_center(:save => false) }
        post :create, :cost_center => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cost_center" do
        CostCenter.stub(:find).with("37") { mock_cost_center }
        mock_cost_center.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cost_center => {'these' => 'params'}
      end

      it "assigns the requested cost_center as @cost_center" do
        CostCenter.stub(:find) { mock_cost_center(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cost_center).should be(mock_cost_center)
      end

      it "redirects to the cost_center" do
        CostCenter.stub(:find) { mock_cost_center(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cost_center_url(mock_cost_center))
      end
    end

    describe "with invalid params" do
      it "assigns the cost_center as @cost_center" do
        CostCenter.stub(:find) { mock_cost_center(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cost_center).should be(mock_cost_center)
      end

      it "re-renders the 'edit' template" do
        CostCenter.stub(:find) { mock_cost_center(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cost_center" do
      CostCenter.stub(:find).with("37") { mock_cost_center }
      mock_cost_center.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cost_centers list" do
      CostCenter.stub(:find) { mock_cost_center }
      delete :destroy, :id => "1"
      response.should redirect_to(cost_centers_url)
    end
  end

end
