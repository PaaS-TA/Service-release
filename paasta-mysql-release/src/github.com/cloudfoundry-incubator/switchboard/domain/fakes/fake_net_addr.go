// This file was generated by counterfeiter
package fakes

import (
	"net"
	"sync"
)

type FakeAddr struct {
	NetworkStub        func() string
	networkMutex       sync.RWMutex
	networkArgsForCall []struct{}
	networkReturns     struct {
		result1 string
	}
	StringStub        func() string
	stringMutex       sync.RWMutex
	stringArgsForCall []struct{}
	stringReturns     struct {
		result1 string
	}
}

func (fake *FakeAddr) Network() string {
	fake.networkMutex.Lock()
	fake.networkArgsForCall = append(fake.networkArgsForCall, struct{}{})
	fake.networkMutex.Unlock()
	if fake.NetworkStub != nil {
		return fake.NetworkStub()
	} else {
		return fake.networkReturns.result1
	}
}

func (fake *FakeAddr) NetworkCallCount() int {
	fake.networkMutex.RLock()
	defer fake.networkMutex.RUnlock()
	return len(fake.networkArgsForCall)
}

func (fake *FakeAddr) NetworkReturns(result1 string) {
	fake.NetworkStub = nil
	fake.networkReturns = struct {
		result1 string
	}{result1}
}

func (fake *FakeAddr) String() string {
	fake.stringMutex.Lock()
	fake.stringArgsForCall = append(fake.stringArgsForCall, struct{}{})
	fake.stringMutex.Unlock()
	if fake.StringStub != nil {
		return fake.StringStub()
	} else {
		return fake.stringReturns.result1
	}
}

func (fake *FakeAddr) StringCallCount() int {
	fake.stringMutex.RLock()
	defer fake.stringMutex.RUnlock()
	return len(fake.stringArgsForCall)
}

func (fake *FakeAddr) StringReturns(result1 string) {
	fake.StringStub = nil
	fake.stringReturns = struct {
		result1 string
	}{result1}
}

var _ net.Addr = new(FakeAddr)
